require 'decoder'

describe Decoder do
  context 'getting data out of email' do

    let(:available_patterns) do
      [ -> (name) { name.join('.') },
        -> (name) { name.first + '.' + name.last[0] },
        -> (name) { name.first[0] + '.' + name.last },
        -> (name) { name.first[0] + '.' + name.last[0] } ]
    end

    let(:decoder) { Decoder.new(available_patterns) }

    it 'name.surname pattern' do
      name = 'John Smith'
      address = 'john.smith@alphasights.com'
      decoder.decode(address, name)
      expect(decoder.domain).to eq 'alphasights.com'
      expect(decoder.name).to eq ['john', 'smith']
      expect(decoder.patterns.first).to eq available_patterns[0]
    end

    it 'name.initial pattern' do
      name = 'John Smith'
      address = 'john.s@alphasights.com'
      decoder.decode(address, name)
      expect(decoder.patterns.first).to eq available_patterns[1]
    end
    it 'initial.surname pattern' do
      name = 'John Smith'
      address = 'j.smith@alphasights.com'
      decoder.decode(address, name)
      expect(decoder.patterns.first).to eq available_patterns[2]
    end
    it 'initial.initial pattern' do
      name = 'John Smith'
      address = 'j.s@alphasights.com'
      decoder.decode(address, name)
      expect(decoder.patterns.first).to eq available_patterns[3]
    end
    it 'no pattern' do
      name = 'John Smith'
      address = 'bla.bla@alphasights.com'
      decoder.decode(address, name)
      expect(decoder.patterns).to eq []
    end
    it 'more than one pattern' do
      name = 'J Smith'
      address = 'j.smith@alphasights.com'
      decoder.decode(address, name)
      expect(decoder.patterns).to eq [available_patterns[0], available_patterns[2]]
    end
  end
end

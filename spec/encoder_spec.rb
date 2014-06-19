require 'encoder'

describe Encoder do
  let(:name) { 'John Smith' }
  let(:domain) { 'alphasights.com' }
  let(:patterns) do
    [
      -> (encoder, name) { encoder.email = name.join('.') + "@#{encoder.domain}" },
      -> (encoder, name) {encoder.email = name.first + '.' + name.last[0] + "@#{encoder.domain}"},
      -> (encoder, name) {encoder.email = name.first[0] + '.' + name.last + "@#{encoder.domain}"},
      -> (encoder, name) {encoder.email = name.first[0] + '.' + name.last[0] + "@#{encoder.domain}"}
    ]
  end

  context 'generating email addresses' do
    it 'name.domain pattern' do
      pattern = patterns[0]
      encoder = Encoder.new(domain, &pattern)
      encoder.encode(name)
      expect(encoder.email).to eq 'john.smith@alphasights.com'
    end
    it 'name.initial pattern' do
      pattern = patterns[1]
      encoder = Encoder.new(domain, &pattern)
      encoder.encode(name)
      expect(encoder.email).to eq 'john.s@alphasights.com'
    end
    it 'initial.surname pattern' do
      pattern = patterns[2]
      encoder = Encoder.new(domain, &pattern)
      encoder.encode(name)
      expect(encoder.email).to eq 'j.smith@alphasights.com'
    end
    it 'initial.initial pattern' do
      pattern = patterns[3]
      encoder = Encoder.new(domain, &pattern)
      encoder.encode(name)
      expect(encoder.email).to eq 'j.s@alphasights.com'
    end
  end

  context 'generating error messages' do
    it 'generates the right message if there is no pattern' do
      pattern = nil
      encoder = Encoder.new(domain, &pattern)
      # encoder.encode(name)
      expect( -> { encoder.encode(name) }).to raise_error
    end
  end
end

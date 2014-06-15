require 'decoder'

describe Decoder do
  context 'getting data out of email' do

    let(:decoder) { Decoder.new }

    it 'name.surname pattern' do
      name = 'John Smith'
      address = 'john.smith@alphasights.com'
      decoder.decode(address, name)
      expect(decoder.domain).to eq 'alphasights.com'
      expect(decoder.first_name).to eq 'john'
      expect(decoder.last_name).to eq 'smith'
      expect(decoder.pattern).to eq :first_name_dot_last_name
    end
  end
end

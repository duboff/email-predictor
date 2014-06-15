require 'decoder'

describe Decoder do
  context 'getting data out of email' do

    let(:decoder) { Decoder.new }

    it 'name.surname pttern' do
      address = 'john.smith@alphasights.com'
      decoder.decode(address)
      expect(decoder.domain).to eq 'alphasights.com'
    end
  end
end

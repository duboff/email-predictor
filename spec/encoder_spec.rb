require 'encoder'

describe Encoder do
  context 'generating email addresses' do

    let(:name) { 'John Smith' }
    let(:domain) { 'alphasights.com' }


    it 'name.domain pattern' do
      pattern = :first_name_dot_last_name
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'john.smith@alphasights.com'
    end
    it 'name.initial pattern' do
      pattern = :first_name_dot_last_initial
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'john.s@alphasights.com'
    end
    it 'initial.surname pattern' do
      pattern = :first_initial_dot_last_name
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'j.smith@alphasights.com'
    end
    it 'initial.initial pattern' do
      pattern = :first_initial_dot_last_initial
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'j.s@alphasights.com'
    end
  end
end

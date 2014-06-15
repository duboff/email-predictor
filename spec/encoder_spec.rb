require 'encoder'

describe Encoder do
  let(:name) { 'John Smith' }
  let(:domain) { 'alphasights.com' }

  context 'generating email addresses' do
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

  context 'generating error messages' do
    it 'generates the right message if there is no pattern' do
      pattern = nil
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'No pattern match'
    end
    it 'generates the right message with a wrong pattern' do
      pattern = :bla_bla
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'No pattern match'
    end
  end
end

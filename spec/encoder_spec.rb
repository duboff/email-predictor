require 'encoder'

describe Encoder do
  context 'generating email addresses' do



    it 'name.domain pattern' do
      pattern = :first_name_dot_last_name
      name = 'John Smith'
      domain = 'alphasights.com'
      encoder = Encoder.new(pattern, domain)
      encoder.encode(name)
      expect(encoder.email).to eq 'john.smith@alphasights.com'
    end
  end
end

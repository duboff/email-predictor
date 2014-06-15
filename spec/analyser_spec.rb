require 'analyser'

describe Analyser do

  let(:decoder) {Decoder.new}

  context 'storing initial data' do
    it 'stores' do
      seed = {
        "John Ferguson" => "john.ferguson@alphasights.com",
        "Damon Aw" => "damon.aw@alphasights.com",
        "Linda Li" => "linda.li@alphasights.com",
        "Larry Page" => "larry.p@google.com",
        "Sergey Brin" => "s.brin@google.com",
        "Steve Jobs" => "s.j@apple.com"
      }
      analyser = Analyser.new(seed, decoder)
      analyser.set_pattern
      expect(analyser.pattern['alphasights.com']).to eq :first_name_dot_last_name
    end
  end
end

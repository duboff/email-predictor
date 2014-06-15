require 'analyser'

describe Analyser do

  let(:decoder) {Decoder.new}
  let(:seed) do
    {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com"
    }
  end

  context 'When the data is conclusive' do
    it 'guesses simple first_name_dot_last_name pattern' do
      analyser = Analyser.new(seed, decoder)
      analyser.set_pattern
      expect(analyser.pattern['alphasights.com']).to eq :first_name_dot_last_name
    end
    it 'guesses simple first_initial_dot_last_initial pattern' do
      analyser = Analyser.new(seed, decoder)
      analyser.set_pattern
      expect(analyser.pattern['apple.com']).to eq :first_initial_dot_last_initial
    end
  end
  context 'when there is no more than one option' do
    it 'does not return a pattern' do
      analyser = Analyser.new(seed, decoder)
      analyser.set_pattern
      expect(analyser.pattern['google.com']).to be_nil
    end
  end
end

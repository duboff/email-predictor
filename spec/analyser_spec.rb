require 'analyser'

describe Analyser do

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
      analyser = Analyser.new(seed)
      analyser.set_pattern
      expect(analyser.pattern['alphasights.com']).to eq :first_name_dot_last_name
    end
    it 'guesses simple first_initial_dot_last_initial pattern' do
      analyser = Analyser.new(seed)
      analyser.set_pattern
      expect(analyser.pattern['apple.com']).to eq :first_initial_dot_last_initial
    end
  end
  context 'when there is no more than one option' do
    it 'does not return a pattern when patterns are different' do
      analyser = Analyser.new(seed)
      analyser.set_pattern
      expect(analyser.pattern['google.com']).to eq :inconclusive
    end
    it 'does return a pattern when all matches are the same' do
      seed["James Peterson"] = 'james.peterson@alphasights.com'
      analyser = Analyser.new(seed)
      analyser.set_pattern
      expect(analyser.pattern['alphasights.com']).to eq :first_name_dot_last_name
    end
  end
end

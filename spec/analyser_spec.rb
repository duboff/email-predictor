require 'analyser'
require 'decoder'

describe Analyser do

  let(:available_patterns) do
    [ -> (name) { name.join('.') },
      -> (name) { name.first + '.' + name.last[0] },
      -> (name) { name.first[0] + '.' + name.last },
      -> (name) { name.first[0] + '.' + name.last[0] } ]
  end
  let(:seed) do
    { "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com" }
  end

  let(:analyser) {Analyser.new(seed, available_patterns)}

  context 'When the data is conclusive' do
    it 'guesses simple first_name_dot_last_name pattern' do
      analyser.set_pattern
      expect(analyser.patterns['alphasights.com'].first).to eq available_patterns[0]
    end
    it 'guesses simple first_initial_dot_last_initial pattern' do
      analyser.set_pattern
      expect(analyser.patterns['apple.com'].first).to eq available_patterns[3]
    end
  end
  context 'when there is no more than one option' do
    it 'does not return a pattern when patterns are different' do
      analyser.set_pattern
      expect(analyser.patterns['google.com']).to eq [available_patterns[1], available_patterns[2]]
    end
    it 'does return a pattern when all matches are the same' do
      seed["James Peterson"] = 'james.peterson@alphasights.com'
      analyser.set_pattern
      expect(analyser.patterns['alphasights.com'].first).to eq available_patterns[0]
    end
  end
end

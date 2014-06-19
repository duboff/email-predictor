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

  before {analyser.set_pattern}

  context 'When the data is conclusive' do
    it 'guesses simple first_name_dot_last_name pattern' do
      expect(analyser.patterns['alphasights.com'].first).to eq available_patterns[0]
    end
    it 'guesses simple first_name_dot_last_name pattern' do
      expect(analyser.patterns['alphasights.com'].first).to eq available_patterns[0]
    end
    it 'guesses simple first_initial_dot_last_initial pattern' do
      expect(analyser.patterns['apple.com'].first).to eq available_patterns[3]
    end
  end
  context 'when there is more than one option' do
    it 'returns all available patterns pattern when patterns are different' do
      expect(analyser.patterns['google.com']).to eq [available_patterns[1], available_patterns[2]]
    end
    it 'returns all available patterns if a name can follow different patterns' do
      seed["J Peterson"] = 'j.peterson@alphasights.com'
      analyser.set_pattern
      expect(analyser.patterns['alphasights.com']).to eq [available_patterns[0], available_patterns[2]]
    end
  end
end

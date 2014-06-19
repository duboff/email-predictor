require 'predictor'
require 'analyser'
require 'encoder'
require 'decoder'

describe Predictor do

  let(:available_patterns) do
    [ -> (name) { name.join('.') },
      -> (name) { name.first + '.' + name.last[0] },
      -> (name) { name.first[0] + '.' + name.last },
      -> (name) { name.first[0] + '.' + name.last[0] } ]
  end

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

  let(:predictor) { Predictor.new(available_patterns) }

  context 'Guessing email addresses' do

    it 'guesses correctly an email when there is a conclusive answer' do
      name, domain = "Peter Wong", "alphasights.com"
      predictor.seed(seed)
      expect(predictor.predict(name, domain).first).to eq "peter.wong@alphasights.com"
    end

    it 'guesses correctly an email when there is a conclusive answer' do
      name, domain = "Steve Wozniak", "apple.com"
      predictor.seed(seed)
      expect(predictor.predict(name, domain).first).to eq "s.w@apple.com"
    end

    it 'guesses correctly an email when there is an inconclusive answer' do
      name, domain = "Craig Silverstein", "google.com"
      predictor.seed(seed)
      expect(predictor.predict(name, domain)).to eq ['craig.s@google.com', 'c.silverstein@google.com']
    end

    it 'guesses correctly an email when there is no match' do
      name, domain = "Barack Obama", "whitehouse.gov"
      predictor.seed(seed)
      expect(predictor.predict(name, domain)).to eq 'No prediction was possible'
    end

  end
end

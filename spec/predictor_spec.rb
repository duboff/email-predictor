require 'predictor'

describe Predictor do

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

  let(:predictor) { Predictor.new }
  context 'Guessing email addresses' do

    it 'guesses correctly an email when there is a conclusive answer' do
      name, domain = "Peter Wong", "alphasights.com"
      predictor.seed(seed)
      # p predictor.analyser
      expect(predictor.predict(name, domain)).to eq "peter.wong@alphasights.com"
    end

  end
end

class Predictor

  attr_accessor :analyser, :available_patterns

  def initialize(available_patterns)
    @available_patterns = available_patterns
  end

  def seed(seed)
    @analyser = Analyser.new(seed, available_patterns)
    self.analyser.set_patterns
  end

  def predict(name, domain)
    encoder = Encoder.new(analyser.patterns[domain], domain)
    encoder.encode(name)
  end
end

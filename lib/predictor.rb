class Predictor

  attr_accessor :analyser

  def seed(seed)
    @analyser = Analyser.new(seed)
  end

  def predict(name, domain)
    analyser.set_pattern
    encoder = Encoder.new(analyser.pattern, domain)
    encoder.encode(name)
  end
end

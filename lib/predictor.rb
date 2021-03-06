class Predictor

  attr_accessor :analyser, :decoder, :available_patterns, :predictions

  def initialize(available_patterns)
    @decoder = Decoder.new(available_patterns)
  end

  def seed(seed)
    @analyser = Analyser.new(seed, decoder)
    self.analyser.set_patterns
  end

  def predict(name, domain)
    return 'No prediction was possible' unless analyser.patterns[domain]
    encoders = analyser.patterns[domain].map {|pattern| Encoder.new(domain, &pattern) }
    encoders.map {|encoder| encoder.encode(name) }
  end

  def predict_correct_only(name, domain)
    return 'No prediction was possible' unless analyser.patterns[domain]
    return 'More than one prediction generated' unless analyser.patterns[domain].size == 1
    analyser.patterns[domain].map {|pattern| Encoder.new(domain, &pattern) }.first.encode(name)
  end
end

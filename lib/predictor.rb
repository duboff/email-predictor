require_relative "./encoder.rb"
require_relative "./decoder.rb"
require_relative "./analyser.rb"


class Predictor

  attr_accessor :analyser

  def seed(seed)
    @analyser = Analyser.new(seed)
    self.analyser.set_pattern
  end

  def predict(name, domain)
    encoder = Encoder.new(analyser.pattern[domain], domain)
    encoder.encode(name)
  end
end

class Analyser

  attr_reader :seed, :decoder
  attr_accessor :pattern

  def initialize(seed, decoder)
    @seed = seed
    @decoder = decoder
    @pattern = {}
  end

  def set_pattern
    @seed.each do |name, email|
      decoder.decode(email, name)
      pattern[decoder.domain] = pattern[decoder.domain] ? nil : decoder.pattern
    end
  end
end

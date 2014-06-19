class Analyser

  attr_reader :seed, :decoder
  attr_accessor :patterns

  def initialize(seed, decoder)
    @seed = seed
    @decoder = decoder
    @patterns = {}
  end

  def set_patterns
    seed.each do |name, email|
      decoder.decode(email, name)
      patterns[decoder.domain] ||= decoder.patterns
      patterns[decoder.domain] += decoder.patterns
      patterns[decoder.domain].uniq!
    end
  end
end

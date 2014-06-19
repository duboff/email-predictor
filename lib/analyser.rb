class Analyser

  attr_reader :seed, :decoder
  attr_accessor :patterns

  def initialize(seed, available_patterns)
    @seed = seed
    @decoder = Decoder.new(available_patterns)
    @patterns = {}
  end

  def set_pattern
    @seed.each do |name, email|
      decoder.decode(email, name)
      patterns[decoder.domain] ||= decoder.pattern
      patterns[decoder.domain] = :inconclusive if patterns[decoder.domain] != decoder.pattern
    end
  end
end

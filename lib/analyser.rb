class Analyser

  attr_reader :seed, :decoder
  attr_accessor :pattern

  def initialize(seed)
    @seed = seed
    @decoder = Decoder.new
    @pattern = {}
  end

  def set_pattern
    @seed.each do |name, email|
      decoder.decode(email, name)
      pattern[decoder.domain] ||= decoder.pattern
      pattern[decoder.domain] = :inconclusive if pattern[decoder.domain] != decoder.pattern

    end
  end
end

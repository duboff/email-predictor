class Encoder

  attr_reader :pattern, :domain
  attr_accessor :email

  def initialize(domain, &pattern)
    @pattern = pattern
    @domain = domain
  end

  def encode(name)
    split = name.downcase.split(' ')
    raise 'Not enough data' unless split.size == 2
    raise 'This pattern is not a lambda' unless @pattern.lambda?
    @email = pattern.call(split) + "@#{domain}"
  end
end

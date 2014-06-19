class Encoder

  attr_reader :pattern, :domain
  attr_accessor :email

  def initialize(domain, &pattern)
    @pattern = pattern
    @domain = domain
  end

  def encode(name)
    split = name.downcase.split(' ')
    raise 'No pattern match' unless @pattern.lambda?
    @email = pattern.call(split) + "@#{domain}"
  end
end

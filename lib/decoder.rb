class Decoder

  attr_accessor :domain, :name, :pattern, :patterns

  def initialize(patterns)
    @patterns = patterns
  end

  def decode(address, full_name)
    address_first, self.domain = address.split('@')
    self.name = full_name.downcase.split(' ')
    self.pattern = get_pattern(address_first)
  end

  def get_pattern(address_first)
    sat = patterns.select{ |pat| pat.call(name) == address_first}
    raise 'Error' unless sat.size == 1
    sat.first
  end
end

class Decoder

  attr_accessor :domain, :name, :patterns, :available_patterns

  def initialize(available_patterns)
    @available_patterns = available_patterns
  end

  def decode(address, full_name)
    address_first, self.domain = address.split('@')
    self.name = full_name.downcase.split(' ')
    self.patterns = get_patterns(address_first)
  end

  def get_patterns(address_first)
    available_patterns.select{ |pat| pat.call(name) == address_first}
  end
end

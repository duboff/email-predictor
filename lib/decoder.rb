class Decoder

  attr_accessor :domain, :first_name, :last_name, :pattern

  def decode(address, name)
    self.domain = address.split('@').last
    self.first_name = name.split(' ').first.downcase
    self.last_name = name.split(' ').last.downcase
    self.pattern = get_pattern(address.split('@').first)
  end

  def get_pattern(address_first)
    case address_first
    when first_name + "." + last_name
      :first_name_dot_last_name
    when first_name + "." + last_name[0]
      :first_name_dot_last_initial
    end
  end
end

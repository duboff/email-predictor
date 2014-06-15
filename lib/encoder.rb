class Encoder

  attr_reader :pattern, :domain
  attr_accessor :email

  def initialize(pattern, domain)
    @pattern = pattern
    @domain = domain
  end

  def encode(name)
    split = name.downcase.split(' ')
    case pattern
    when :first_name_dot_last_name
      self.email = split.join('.') + "@#{domain}"
    end
  end


end

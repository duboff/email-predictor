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
    when :first_name_dot_last_initial
      self.email = split.first + '.' + split.last[0] + "@#{domain}"
    when :first_initial_dot_last_name
      self.email = split.first[0] + '.' + split.last + "@#{domain}"
    when :first_initial_dot_last_initial
      self.email = split.first[0] + '.' + split.last[0] + "@#{domain}"
    end
  end


end

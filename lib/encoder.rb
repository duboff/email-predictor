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
    @pattern.call(self, split)
  end
end

# first_name_dot_last_name = -> (encoder, name) { encoder.email = name.join('.') + "@#{encoder.domain}" }
# first_name_dot_last_initial = -> (encoder, name) {encoder.email = name.first + '.' + name.last[0] + "@#{encoder.domain}"}
# first_initial_dot_last_name = -> (encoder, name) {encoder.email = name.first[0] + '.' + name.last + "@#{encoder.domain}"}
# first_initial_dot_last_initial = -> (encoder, name) {encoder.email = name.first[0] + '.' + name.last[0] + "@#{encoder.domain}"}


# first_initial_dot_last_initial = -> (encoder, name) {encoder.email = }

# case pattern
#    when :first_name_dot_last_name
#      self.email = split.join('.') + "@#{domain}"
#    when :first_name_dot_last_initial
#      self.email = split.first + '.' + split.last[0] + "@#{domain}"
#    when :first_initial_dot_last_name
#      self.email = split.first[0] + '.' + split.last + "@#{domain}"
#    when :first_initial_dot_last_initial
#      self.email = split.first[0] + '.' + split.last[0] + "@#{domain}"
#    else
#      self.email = 'No pattern match'
#    end

# encoder = Encoder.new('alphasights.com', &first_name_dot_last_name)

# encoder.encode('Mikhail Dubov')
# p encoder.email

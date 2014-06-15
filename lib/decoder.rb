class Decoder

  attr_accessor :domain

  def decode(address)
    self.domain = address.split('@').last
  end
end

class BeardedTyrion::User
  attr_accessor :name, :image, :token, :secret

  def initialize(attrs)
    @name = attrs[:name]
    @image = attrs[:image]
    @token = attrs[:token]
    @secret = attrs[:secret]
  end
end

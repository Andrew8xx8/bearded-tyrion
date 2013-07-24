class BeardedTyrion::User
  attr_accessor :name, :image, :token, :secret

  def initialize(attrs)
    @name = attrs[:name]
    @image = attrs[:image]
    @token = attrs[:token]
    @secret = attrs[:secret]
  end

  def to_session
    {
      name:   @name,
      image:  @image,
      token:  @token,
      secret: @secret
    }
  end
end

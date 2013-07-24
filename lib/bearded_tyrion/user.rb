class BeardedTyrion::User
  attr_accessor :name, :image, :token, :secret

  class << self
    def populate_from_session(session)
      new session[:auth] if session.has_key? :auth
    end

    def populate_from_oauth(omniauth_hash)
      return nil unless omniauth_hash.has_key?("info")
      return nil unless omniauth_hash.has_key?("credentials")

      self.new({
        name:   omniauth_hash['info']['name'],
        image:  omniauth_hash['info']['image'],
        token:  omniauth_hash['credentials']['token'],
        secret: omniauth_hash['credentials']['secret']
      })
    end
  end

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

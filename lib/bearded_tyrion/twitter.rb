class BeardedTyrion::Twitter
  def initialize(user)
    return nil unless user

    Twitter.configure do |config|
      config.consumer_key = BeardedTyrion.consumer_key
      config.consumer_secret = BeardedTyrion.consumer_secret
      config.oauth_token = user.token
      config.oauth_token_secret = user.secret
      config.connection_options = Twitter::Default::CONNECTION_OPTIONS.merge(:request => { 
        :open_timeout => 5,
        :timeout => 10
      })
    end
  end

  def client
    Twitter
  end
end

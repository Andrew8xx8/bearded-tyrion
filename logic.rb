
def parse_omniauth(omniauth_hash)
  {
    name:   omniauth_hash['info']['name'],
    image:  omniauth_hash['info']['image'],
    token:  omniauth_hash['credentials']['token'],
    secret: omniauth_hash['credentials']['secret']
  }
end

def twitter_client
  return nil unless oauth_token
  return nil unless oauth_token_secret

  Twitter.configure do |config|
    config.consumer_key = consumer_key
    config.consumer_secret = consumer_secret
    config.oauth_token = oauth_token
    config.oauth_token_secret = oauth_token_secret
    config.connection_options = Twitter::Default::CONNECTION_OPTIONS.merge(:request => { 
      :open_timeout => 5,
      :timeout => 10
    })
  end

  Twitter
end

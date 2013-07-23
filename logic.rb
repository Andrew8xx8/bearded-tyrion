def consumer_key
  raise "Missing CONSUMER_KEY in ENV!" unless ENV["CONSUMER_KEY"]

  ENV["CONSUMER_KEY"]
end

def consumer_secret
  raise "Missing CONSUMER_SECRET in ENV!" unless ENV["CONSUMER_SECRET"]

  ENV["CONSUMER_SECRET"]
end

def oauth_token
  return nil unless session.has_key?( :auth ) && session[:auth].has_key?( :token )

  session[:auth][:token]
end

def oauth_token_secret
  return nil unless session.has_key?( :auth ) && session[:auth].has_key?( :secret )

  session[:auth][:secret]
end

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

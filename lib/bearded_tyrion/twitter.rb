class BeardedTyrion::Twitter
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
end

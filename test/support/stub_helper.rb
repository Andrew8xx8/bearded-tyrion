def fixture_path
  File.expand_path("../../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def stub_auth_request
  stub_request(:post, "https://test:test@api.twitter.com/oauth2/token").with(:body => "grant_type=client_credentials").to_return(:body => fixture("bearer_token.json"), :headers => {:content_type => "application/json; charset=utf-8"})
end

def stub_direct_messages
  stub_request(:get, "https://api.twitter.com/1.1/direct_messages.json").to_return(:status => 200, :body => fixture("direct_messages.json"))
end

def stub_user_timeline
  stub_request(:get, "https://api.twitter.com/1.1/direct_messages.json").to_return(:status => 200, :body => fixture("user_timeline.json"))
end

def stub_favorites
  stub_request(:get, "https://api.twitter.com/1.1/favorites/list.json").to_return(:status => 200, :body => fixture("user_timeline.json"))
end

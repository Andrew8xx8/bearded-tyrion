require 'test_helper'
require 'rack/test'

ENV['RACK_ENV'] = 'test'
ENV['CONSUMER_KEY'] = 'test'
ENV['CONSUMER_SECRET'] = 'test'

class BeardedTyrion::WebTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    BeardedTyrion::Web
  end

  def test_download
    post '/download'
    assert last_response.ok?
  end

  def test_index
    get '/'
    assert last_response.ok?
  end

  def test_auth_failure
    get '/auth/failure'
    assert last_response.redirect?
  end
end

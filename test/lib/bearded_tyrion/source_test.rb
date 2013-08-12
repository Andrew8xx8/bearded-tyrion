require 'test_helper'
require 'webmock/minitest'

class BeardedTyrion::SourceTest < MiniTest::Test
  def setup
    stub_auth_request

    user = BeardedTyrion::User.new({
      "name" => "name",
      "image" => "name",
      "token" => "token",
      "secret" => "secret"
    })

    @twitter = BeardedTyrion::Twitter.new(user)
  end

  def test_params_to_save
    params = {
      "source" => [
        "direct_messages",
        "wrong_param",
      ]
    }

    source = BeardedTyrion::Source.new
    source.fill_params(params)

    assert source.fields == [:direct_messages]
  end

  def test_get_tweets
    stub_direct_messages
    stub_user_timeline
    stub_favorites

    source = BeardedTyrion::Source.new
    source.available_options.each do |attribute|
      params = {
        "source" => [
          attribute.to_s
        ]
      }

      source.fill_params(params)

      assert source.tweets(@twitter).count > 0
    end
  end
end

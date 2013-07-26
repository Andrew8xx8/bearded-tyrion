require 'test_helper'

class BeardedTyrion::UserTest < MiniTest::Test
  def test_populate_from_session
    session = {
      auth: {
        name: "name",
        image: "name",
        token: "token",
        secret: "secret"
      }
    }

    user = BeardedTyrion::User.populate_from_session session
    assert user.kind_of?(BeardedTyrion::User)
  end

  def test_populate_from_oauth
    oauth = {
      "info" => {
        "name" => "name",
        "image" => "name",
      },
      "credentials" => {
        "token" => "token",
        "secret" => "secret"
      }
    }

    user = BeardedTyrion::User.populate_from_oauth oauth
    assert user.kind_of?(BeardedTyrion::User)
  end

  def test_to_session
    attrs = {
      "name" => "name",
      "image" => "name",
      "token" => "token",
      "secret" => "secret"
    }

    user = BeardedTyrion::User.new(attrs)
    hash = user.to_session
    assert hash.kind_of?(Hash)
  end
end

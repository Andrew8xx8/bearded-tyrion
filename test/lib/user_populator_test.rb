require 'test_helper'

class BeardedTyrion::UserPopulatorTest < MiniTest::Test

  def test_populate_from_session
    session = {
      "name" => "name",
      "image" => "name",
      "token" => "token",
      "secret" => "secret"
    }

    user = BeardedTyrion::UserPopulator.populate_from_session session
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

    user = BeardedTyrion::UserPopulator.populate_from_oauth oauth
    assert user.kind_of?(BeardedTyrion::User)
  end
end

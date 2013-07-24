require 'test_helper'

class BeardedTyrion::UserTest < MiniTest::Test

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

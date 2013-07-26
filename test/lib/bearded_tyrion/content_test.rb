require 'test_helper'

class BeardedTyrion::ContentTest < MiniTest::Test
  def test_params_to_save
    params = {
      "content" => [
        "id",
        "message",
        "wrong_param"
      ]
    }

    content = BeardedTyrion::Content.new
    content.fill_params(params)

    assert content.fields == [:id, :message]
  end
end

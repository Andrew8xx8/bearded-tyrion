require 'test_helper'

class BeardedTyrion::FormatTest < MiniTest::Test
  def test_params_to_save
    params = {
      "format" => [
        "plain_text",
        "wrong_param",
      ]
    }

    content = BeardedTyrion::Format.new
    content.fill_params(params)

    assert content.fields == [:plain_text]
  end
end

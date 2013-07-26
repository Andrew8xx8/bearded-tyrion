require 'test_helper'

class BeardedTyrion::SourceTest < MiniTest::Test
  def test_params_to_save
    params = {
      "source" => [
        "direct_messages",
        "wrong_param",
      ]
    }

    content = BeardedTyrion::Source.new
    content.fill_params(params)

    assert content.fields == [:direct_messages]
  end
end

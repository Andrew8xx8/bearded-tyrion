class BeardedTyrion::Format < BeardedTyrion::OptionsGroup
  attr_reader :fields

  def available_options
    [
      :plain_text,
      :csv
    ]
  end

  def form_field_name
    "format"
  end

  def format(tweet)

  end
end

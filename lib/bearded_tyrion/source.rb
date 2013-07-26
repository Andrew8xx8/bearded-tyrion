class BeardedTyrion::Source < BeardedTyrion::OptionsGroup
  attr_reader :fields

  def available_options
    [
      :direct_messages,
      :favorites,
      :user_timeline
    ]
  end

  def form_field_name
    "source"
  end
end

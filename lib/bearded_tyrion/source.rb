class BeardedTyrion::Source < BeardedTyrion::OptionsGroup
  attr_reader :fields

  def available_options
    [
      :direct_messages,
      :favorites
    ]
  end

  def form_field_name
    "source"
  end

  def tweets(twitter)
    twitter.client.send(get_method) if get_method
  end

  private

  def get_method
    fields.first
  end
end

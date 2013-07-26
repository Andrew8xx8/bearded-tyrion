class BeardedTyrion::Content < BeardedTyrion::OptionsGroup
  attr_reader :fields

  def available_options
    [
      :id,
      :message,
      :date
    ]
  end

  def form_field_name
    "content"
  end
end

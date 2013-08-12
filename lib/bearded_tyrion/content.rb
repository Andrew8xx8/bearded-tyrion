class BeardedTyrion::Content < BeardedTyrion::OptionsGroup
  attr_reader :fields

  def default_options
    [
      :id,
      :text,
      :user_screen_name,
      :created_at
    ]
  end

  def form_field_name
    "content"
  end

  def get_contents(tweet)
    tweet = tweet.to_hash
    result = {}

    fields.each do |field|
      field = field.to_sym
      if tweet.has_key?(field)
        result[field] = tweet[field]
      else
        result[:user] = tweet[:user][:name] if field == :user
        result[:user] = tweet[:user][:id] if field == :user_id
        result[:user] = tweet[:user][:screen_name] if field == :user_screen_name
      end
    end

    result
  end
end

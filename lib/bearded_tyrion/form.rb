class BeardedTyrion::Form
  include ::ActiveModel::Validations
  include ::ActiveModel::Conversion

  extend ::Enumerize

  enumerize :source, in: [
    :direct_messages,
    :favorites
  ]

  enumerize :content, in: [
    :id,
    :text,
    :user,
    :user_id,
    :user_screen_name,
    :created_at,
    :place,
    :geo,
    :favorited,
    :source,
    :in_reply_to_status_id,
    :retweet_count,
    :retweeted
  ], multiple: true

  enumerize :format, in: [
    :plain_text,
    :csv
  ]

  def persisted?
    false
  end
end

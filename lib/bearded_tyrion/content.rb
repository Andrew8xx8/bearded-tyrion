class BeardedTyrion::Content
  attr_reader :fields
  class << self
    def available_options
      [
        { name: :id, value: "ID" },
        { name: :message, value: "Message" },
        { name: :date, value: "Date/Time" }
      ]
    end

    def form_field_name
      "content"
    end
  end

  def initialize(form_hash)
    @fields = []
    fill_fields(form_hash[BeardedTyrion::Content.form_field_name])
  end

  private

  def fill_fields(params)
    @fields = []

    BeardedTyrion::Content.available_options.each do |option|
      @fields << option[:name] if params.include?(option[:name].to_s)
    end
  end
end

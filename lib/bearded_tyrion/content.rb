class BeardedTyrion::Content
  attr_reader :fields

  def self.available_options
    [
      { name: :id, value: "ID" },
      { name: :message, value: "Message" },
      { name: :date, value: "Date/Time" }
    ]
  end

  def initialize(form_hash)
    @fields = []
    fill_fields(form_hash["content"])
  end

  private

  def fill_fields(params)
    @fields = []

    BeardedTyrion::Content.available_options.each do |option|
      @fields << option[:name] if params.include?(option[:name].to_s)
    end
  end
end

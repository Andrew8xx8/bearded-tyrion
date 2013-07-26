class BeardedTyrion::OptionsGroup
  attr_reader :fields

  def available_options
    []
  end

  def form_field_name
    "default"
  end

  def initialize
    @fields = []
  end

  def fill_params(form)
    params = form[form_field_name]
    params.map! { |p| p.to_sym }
    @fields = params & available_options
  end
end

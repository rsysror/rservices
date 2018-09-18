module FormElement
  def rservice_text_field field_value, label_value, form
    (label_tag label_value)+
    (form.text_field field_value.to_sym, class:"form-control" )
  end

  def rservice_text_area field_value, label_value, form
    (label_tag label_value)+
    (form.text_area field_value.to_sym, class:"form-control" )
  end

  def rservice_hidden_field field_value, value, form
    form.hidden_field field_value.to_sym, value: value
  end

  def reservice_value_printer label ,value
    content_tag(:b, label) +
    (value)
  end
end
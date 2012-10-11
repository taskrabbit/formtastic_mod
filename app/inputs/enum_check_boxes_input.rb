class EnumCheckBoxesInput < ::Formtastic::Inputs::CheckBoxesInput
  def to_html
    input_wrapping do
      enum_field = options[:enum_field]
      enum_class = options[:enum_class]

      values = enum_class.const_get(enum_field.to_s.pluralize.upcase)
      selected = []
      field_name = "#{@object_name}[#{method}_attributes][][#{enum_field}]"
      if @object
        selected = @object.send(method).collect {|i| i.send(enum_field) }
      end
      list_item_text = ""
      values.each do |i|
        check_box = template.check_box_tag field_name, i, selected.include?(i)
        li_content = template.content_tag(:label, (check_box + " #{i}").html_safe)
        list_item_text += template.content_tag(:li, li_content.html_safe)
      end

      if options[:allow_other]
        text_input = template.text_field_tag field_name, selected - values
        li_content = template.content_tag(:label, ("Other" + text_input).html_safe)
        list_item_text += template.content_tag(:li, li_content.html_safe, :class => "string other")
      end


      fieldset_text = template.content_tag(:legend,
      builder.label(method, label_text, options_for_label.merge(:for => options.delete(:label_for))))
      fieldset_text += template.content_tag(:ol, list_item_text.html_safe)
      template.content_tag(:fieldset, fieldset_text.html_safe)
    end
  end
end
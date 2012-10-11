class MoneyInput < ::Formtastic::Inputs::StringInput
  def dollars_basic_input_helper(form_helper_method, type, method, options)
    html_options = options.delete(:input_html) || {}
    # html_options = default_string_options(method, type).merge(html_options) if [:numeric, :string, :password, :text].include?(type)

    defaultVal = options.delete(:if_zero)
    if defaultVal and @object.respond_to?("#{method}".to_sym)
      if @object.send("#{method}".to_sym).to_i == 0
        html_options[:value] = defaultVal
      end
    end
    # copied this whole method from formtastic to add this "$" in
    label_html << "<span class=\"inputDollar#{dollars_add_class(html_options)}\">$</span>".html_safe <<
    builder.send(form_helper_method, method, html_options)
  end

  def dollars_add_class(input_html)
    return "" unless (input_html and input_html[:class])
    " #{input_html[:class]}"
  end
end
class CentsInput < MoneyInput
  def to_html
    input_wrapping do
      options[:input_html] ||= {}
      options[:input_html][:size] ||= 15
      dollars_basic_input_helper(:text_field, :numeric, method, options)
    end
  end
end
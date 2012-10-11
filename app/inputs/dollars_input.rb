class DollarsInput < MoneyInput
  def to_html
    input_wrapping do
      options[:input_html] ||= {}
      options[:input_html][:size] ||= 10
      options[:if_zero] = "" if options[:if_zero].nil?
      dollars_basic_input_helper(:text_field, :numeric, method, options) +  "<span class=\"inputCents#{dollars_add_class(options[:input_html])}\">.00</span>".html_safe
    end
  end
end
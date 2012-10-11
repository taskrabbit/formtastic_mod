class TimeaheadInput < ::Formtastic::Inputs::SelectInput
  include ActionView::Helpers::DateHelper

  def to_html
    input_wrapping do
      @current_time = @object.send(method)

      day_method = (method.to_s + '_day').to_sym
      minutes_method = (method.to_s + '_minutes').to_sym

      options[:include_blank] = false
      options[:product_task] = false if options[:product_task].nil?
      options[:questions] = false

      collection = @object.class.timeahead_days(@object.send(day_method), options[:product_task])[:collection]

      text = options[:label]
      text = localized_string(method, (text==false ? nil : text), :label) || @object.class.human_attribute_name(method.to_s)
      text = "Time" if text.blank?

      text = "" if options[:label] == false # mimicking formtastic label false option
      options[:label] = false
      out =   "<label class='timeahead_day_label'>#{text}</label>"
      options[:input_html] ||= {}
      options[:input_html][:class] = 'timeahead_day_input'
      out += builder.select(day_method, collection, options, options[:input_html])

      if options[:product_task]
        collection = [['Morning', 540], ['Mid-Day', 720], ['Evening', 900]]
        options[:input_html] ||= {}
        options[:input_html][:class] = 'timeahead_minutes_input'
        out += builder.select(minutes_method, collection, options, options[:input_html])
      else
        collection = @object.class.timeahead_minutes(@object.send(minutes_method))[:collection]
        out += "<label class='timeahead_minutes_label'>at</label>"
        options[:input_html] ||= {}
        options[:input_html][:class] = 'timeahead_minutes_input'
        out += builder.select(minutes_method, collection, options, options[:input_html])
      end
      out.html_safe
    end
  end
end
module FormtasticMod
  module HintAsTitle
    extend ActiveSupport::Concern

    included do
      alias_method :input_before_as_title, :input unless method_defined?(:input_before_as_title)
      alias_method :input, :hint_as_title_input
    end

    def hint_as_title_input(method, options = {})
      hint = options.delete(:hint_title)
      place = options.delete(:placeholder_title)
      val = place || hint
      if val
         if val == true
           # get from en.yml
           val = localized_string(method, options[:hint], :hint)
         end
         options[:input_html] ||= {}
         if place
           options[:input_html][:placeholder] = val
         else
           options[:input_html][:title] = val
         end
         options[:hint] = false # don't show the hint
      end
      input_before_as_title(method, options)
    end
  end
end
module FormtasticMod
  module HintAfterLabel
    module InputHelper
      extend ActiveSupport::Concern

      included do
        alias_method :input_before_after_label, :input unless method_defined?(:input_before_after_label)
        alias_method :input, :hint_after_label
      end

      def hint_after_label(method, options = {})
        val = options[:hint_after_label]
        if val
          if val == true
            # get from en.yml
            options[:hint_after_label] = localized_string(method, options[:hint], :hint)
          else
           options[:hint_after_label] = val
         end
           options[:hint] = false # don't show the hint
         end
         input_before_after_label(method, options)
       end
     end
  end
end
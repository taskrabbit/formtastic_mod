module FormtasticMod
  module HintAfterLabel
    module Labelling
      extend ActiveSupport::Concern

      included do
        alias_method :old_label_html_options, :label_html_options
        alias_method :label_html_options, :label_options_with_hint

        alias_method :old_label_html, :label_html
        alias_method :label_html, :label_html_with_hint
      end

      def label_options_with_hint
        old_label_html_options.merge({:hint_after_label => options[:hint_after_label]})
      end

      def label_html_with_hint
        lbl = old_label_html
        template.raw(lbl + (options && options[:hint_after_label] ? template.content_tag(:p, options[:hint_after_label], :class => "inline-hint") : ""))
      end
    end
  end
end
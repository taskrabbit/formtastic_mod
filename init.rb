if Object.const_defined?("Formtastic")
  require File.dirname(__FILE__) + '/lib/formtastic_extensions'
  require File.dirname(__FILE__) + '/lib/formtastic_custom'
  require File.dirname(__FILE__) + '/lib/formtastic_hint_as_title'
  require File.dirname(__FILE__) + '/lib/hint_after_label'

  Formtastic::FormBuilder.send(:include, Taskrabbit::Formtastic)
  Formtastic::FormBuilder.send(:include, Taskrabbit::Formtastic::HintAsTitle)

  Formtastic::Helpers::InputHelper.send(:include, Taskrabbit::Formtastic::HintAfterLabel::InputHelper)
  Formtastic::Inputs::Base::Labelling.send(:include, Taskrabbit::Formtastic::HintAfterLabel::Labelling)
end

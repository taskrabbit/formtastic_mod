require 'formtastic_mod/version'

require 'formtastic_mod/engine' if defined?(Rails)

module FormtasticMod

  autoload :CustomForm,     'formtastic_mod/custom_form'
  autoload :HintAsTitle,    'formtastic_mod/hint_as_title'

  module HintAfterLabel
    autoload :InputHelper,        'formtastic_mod/hint_after_label/input_helper'
    autoload :Labelling,           'formtastic_mod/hint_after_label/labelling'
  end

end

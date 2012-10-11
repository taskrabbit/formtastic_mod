module FormtasticMod
  class Engine < ::Rails::Engine

    initializer 'formtastic_mod.hooks' do
      ActiveSupport.on_load(:formtastic) do
        ::Formtastic::FormBuilder.send(:include, FormtasticMod::HintAsTitle)
        ::Formtastic::Helpers::InputHelper.send(:include, FormtasticMod::HintAfterLabel::InputHelper)
        ::Formtastic::Inputs::Base::Labelling.send(:include, FormtasticMod::HintAfterLabel::Labelling)
      end
    end

  end
end
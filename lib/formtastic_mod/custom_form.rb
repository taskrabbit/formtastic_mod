module FormtasticMod
  class CustomForm < ::Formtastic::FormBuilder
    def initialize(template, object)
      super(object.class.model_name.underscore.to_sym, object, template, {}, nil)
    end
  end
end

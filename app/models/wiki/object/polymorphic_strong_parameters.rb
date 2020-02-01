module Wiki::Object::PolymorphicStrongParameters
  extend ActiveSupport::Concern

  class_methods do
    def modifiable_properties
      const_get(:MODIFIABLE_PROPERTIES)
    end
  end

  included do
    delegate :modifiable_properties, to: :class
  end
end
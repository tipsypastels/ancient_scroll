module Wiki::Object::Icons
  extend ActiveSupport::Concern

  class_methods do
    def icon
      self.const_get(:ICON)
    end
  end
end
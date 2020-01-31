module Wiki::Object
  extend ActiveSupport::Concern
  
  included do
    acts_as_api
    include Content, Canon, Identifiable, Linkable, Trackable
  end

  def to_form_locals
    {}.tap { |h| h[type.to_sym] = self}
  end
end
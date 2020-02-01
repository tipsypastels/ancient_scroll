module Wiki::Object
  extend ActiveSupport::Concern
  
  included do
    acts_as_api

    api_accessible :show do |api|
      api.add :intrinsic?
    end

    include Content, Canon, Identifiable, Linkable, Trackable, Scopes, Icons, PolymorphicStrongParameters
  end

  def intrinsic?
    false
  end

  def to_form_locals
    {}.tap { |h| h[type.to_sym] = self }
  end
end
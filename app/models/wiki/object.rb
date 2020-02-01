module Wiki::Object
  extend ActiveSupport::Concern
  
  def self.types
    @types ||= {
      regions: Wiki::Region,
      provinces: Wiki::Province,
      locations: Wiki::Location,
      # quests
      characters: Wiki::Character,
      organizations: Wiki::Organization,
      trainer_classes: Wiki::TrainerClass,
      # pokemon, abilities, moves
      sheets: Wiki::Sheet,
    }.with_indifferent_access
  end

  def self.types_not_disabled
    @types_not_disabled ||= types.reject { |_, v| v.disabled_in_config? }.to_h
  end

  class_methods do
    def disabled_in_config?
      false
    end
  end

  included do
    acts_as_api

    api_accessible :show do |api|
      api.add :intrinsic?
    end

    include Content, Canon, Linkable, Trackable, Scopes, Icons, PolymorphicStrongParameters
  end

  def intrinsic?
    false
  end

  def to_form_locals
    {}.tap { |h| h[type.to_sym] = self }
  end
end
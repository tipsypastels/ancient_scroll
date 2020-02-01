module Wiki::Object::Identifiable
  extend ActiveSupport::Concern

  included do
    has_one :identifier, as: :identifiable

    after_create :create_identifier
    delegate :slug, to: :identifier, allow_nil: true
  end

  private

  def create_identifier
    Wiki::Identifier.create!(identifiable: self) unless identifier
  end
end
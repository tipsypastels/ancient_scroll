module Wiki::Object::Scopes
  extend ActiveSupport::Concern

  included do
    scope :as_list, -> {
      order(updated_at: :desc)
    }

    scope :as_list_on_category, -> {
      as_list
        .with_attached_image
        .includes(:non_canonicity)
    }
  end
end
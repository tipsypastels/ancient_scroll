module AccessHelper
  delegate :can_create_object?, :can_edit_object?, to: :controller
end
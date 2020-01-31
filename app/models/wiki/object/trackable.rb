module Wiki::Object::Trackable
  extend ActiveSupport::Concern

  included do
    api_accessible :index do |api|
      api.add :last_updated_user, template: :index
    end

    belongs_to :last_updated_user, 
      class_name: 'User', 
      foreign_key: :updated_by, 
      optional: true

    before_update :set_updating_user
  end

  private

  def set_updating_user
    self.updated_by = Current.user_id
  end
end
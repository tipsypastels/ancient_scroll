# == Schema Information
#
# Table name: trainer_classes
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  specialty  :string
#  updated_by :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_trainer_classes_on_slug  (slug) UNIQUE
#

class Wiki::TrainerClass < ApplicationRecord
  include Wiki::Object

  ICON = :certificate

  has_many :characters

  api_accessible :show do |api|
    api.add :characters, template: :index
  end
end

# == Schema Information
#
# Table name: trainer_classes
#
#  id         :bigint           not null, primary key
#  name       :string
#  specialty  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TrainerClass < ApplicationRecord
  include Wiki::Object
  has_many :characters

  api_accessible :show do |api|
    api.add :characters, template: :index
  end
end

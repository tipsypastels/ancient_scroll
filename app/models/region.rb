# == Schema Information
#
# Table name: regions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < ApplicationRecord
  include Wiki::Object

  has_many :locations

  api_accessible :show do |api|
    api.add :locations, template: :index
  end
end

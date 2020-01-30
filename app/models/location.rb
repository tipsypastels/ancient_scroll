# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#

class Location < ApplicationRecord
  include Wiki::Object

  belongs_to :region
  
  has_many :character_presences
  has_many :characters, through: :character_presences

  has_many :item_presences
  has_many :items, through: :item_presences

  api_accessible :show do |api|
    api.add :region, template: :index
    api.add :characters, template: :index
    api.add :items, template: :index
  end
end

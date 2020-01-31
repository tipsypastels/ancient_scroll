# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  map_type   :integer
#  name       :string
#  population :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#

class Location < ApplicationRecord
  include Wiki::Object

  def self.habitable?(map_type)
    map_type.in? HABITABLE
  end

  HABITABLE = %w|town city|

  scope :habitable, -> {
    where(map_type: HABITABLE)
  }

  belongs_to :region
  
  has_many :character_presences
  has_many :characters, through: :character_presences

  has_many :residents, class_name: 'Character', foreign_key: :hometown_id

  has_many :item_presences
  has_many :items, through: :item_presences

  validates :map_type, presence: true

  enum map_type: {
    route:      0,
    town:       1,
    city:       2,
    cave:       3,
    underwater: 4,
    inside:     5,
    gym:        6,
  }

  api_accessible :show do |api|
    api.add :map_type
    api.add :habitable?

    api.add :region, template: :index
    api.add :characters, template: :index
    api.add :items, template: :index
  end

  def habitable?
    map_type.in? HABITABLE
  end

  def modifiable_properties
    %i|region_id population map_type|
  end
end

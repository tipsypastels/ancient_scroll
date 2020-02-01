# == Schema Information
#
# Table name: locations
#
#  id          :bigint           not null, primary key
#  map_type    :integer
#  name        :string
#  population  :integer
#  slug        :string
#  updated_by  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  province_id :integer
#  region_id   :integer
#
# Indexes
#
#  index_locations_on_slug  (slug) UNIQUE
#

class Wiki::Location < ApplicationRecord
  include Wiki::Object

  ICON = :city
  MODIFIABLE_PROPERTIES = %i|region_id province_id population map_type|

  def self.habitable?(map_type)
    map_type.in? HABITABLE
  end

  HABITABLE = %w|town city|

  scope :habitable, -> {
    where(map_type: HABITABLE)
  }

  belongs_to :region
  belongs_to :province, optional: true
  
  has_many :character_presences
  has_many :characters, through: :character_presences

  has_many :residents, class_name: 'Wiki::Character', foreign_key: :hometown_id

  has_many :item_presences
  has_many :items, through: :item_presences

  validates :map_type, presence: true
  validates :province, presence: true, if: -> { Wiki.config.provinces? }

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
    api.add :residents, template: :index
  end

  def habitable?
    map_type.in? HABITABLE
  end
end

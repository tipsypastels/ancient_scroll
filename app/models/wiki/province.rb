# == Schema Information
#
# Table name: provinces
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  updated_by :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#
# Indexes
#
#  index_provinces_on_slug  (slug) UNIQUE
#

class Wiki::Province < ApplicationRecord
  def self.disabled_in_config?
    not Wiki.config.provinces?
  end

  include Wiki::Object

  ICON = :'map-signs'

  belongs_to :region
  has_many :locations
end

# == Schema Information
#
# Table name: provinces
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#

class Wiki::Province < ApplicationRecord
  include Wiki::Object

  ICON = :'map-signs'

  belongs_to :region
  has_many :locations
end

# == Schema Information
#
# Table name: item_presences
#
#  id          :bigint           not null, primary key
#  context     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :integer
#  location_id :integer
#

class ItemPresence < ApplicationRecord
  belongs_to :item
  belongs_to :location
end

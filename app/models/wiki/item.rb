# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  updated_by :integer
#
# Indexes
#
#  index_items_on_slug  (slug) UNIQUE
#

class Wiki::Item < ApplicationRecord
  include Wiki::Object

  ICON = :'shopping-bag'

  has_many :item_presences
  has_many :locations, through: :item_presences
end

# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string
#  updated_by :integer
#

class Wiki::Item < ApplicationRecord
  include Wiki::Object

  ICON = :'shopping-bag'

  has_many :item_presences
  has_many :locations, through: :item_presences
end

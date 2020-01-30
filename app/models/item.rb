# == Schema Information
#
# Table name: items
#
#  id   :bigint           not null, primary key
#  name :string
#

class Item < ApplicationRecord
  include Wiki::Object

  has_many :item_presences
  has_many :locations, through: :item_presences
end

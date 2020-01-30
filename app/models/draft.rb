# == Schema Information
#
# Table name: drafts
#
#  id             :bigint           not null, primary key
#  draftable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  draftable_id   :integer
#

class Draft < ApplicationRecord
  belongs_to :draftable, polymorphic: true
end

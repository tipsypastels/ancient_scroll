# == Schema Information
#
# Table name: locks
#
#  id            :bigint           not null, primary key
#  lockable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lockable_id   :integer
#

class Lock < ApplicationRecord
  belongs_to :lockable, polymorphic: true
end

# == Schema Information
#
# Table name: non_canonicities
#
#  id          :bigint           not null, primary key
#  object_type :string
#  reason      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  object_id   :integer
#

class NonCanonicity < ApplicationRecord
  belongs_to :object, polymorphic: true

  acts_as_api
  api_accessible :show do |api|
    api.add :canon?
    api.add :reason
  end

  def canon?
    false
  end
end

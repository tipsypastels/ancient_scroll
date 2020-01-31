# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord
  include Wiki::Object

  has_many :organization_memberships
  has_many :members, through: :organization_memberships, class_name: 'Character', source: :character

  def memberships
    organization_memberships
  end
end

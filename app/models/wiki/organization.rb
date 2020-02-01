# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  updated_by :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_organizations_on_slug  (slug) UNIQUE
#

class Wiki::Organization < ApplicationRecord
  include Wiki::Object

  ICON = :users

  has_many :organization_memberships
  has_many :members, through: :organization_memberships, class_name: 'Wiki::Character', source: :character

  def memberships
    organization_memberships
  end
end

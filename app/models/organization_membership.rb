# == Schema Information
#
# Table name: organization_memberships
#
#  id              :bigint           not null, primary key
#  former          :boolean          default(FALSE)
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  character_id    :integer
#  organization_id :integer
#

class OrganizationMembership < ApplicationRecord
  default_scope {
    order('former desc')
  }

  belongs_to :character
  belongs_to :organization

  delegate :name, :path, to: :organization

  acts_as_api

  api_accessible :index do |api|
    api.add :former?
    api.add :role
    api.add :name
    api.add :path
  end
end

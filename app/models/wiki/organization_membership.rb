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

class Wiki::OrganizationMembership < ApplicationRecord
  belongs_to :character
  belongs_to :organization

  delegate :name, :path, :api_path, to: :organization

  acts_as_api

  api_accessible :index do |api|
    api.add :type
    api.add :organization_id
    api.add :former?
    api.add :role
    api.add :name
    api.add :path
    api.add :api_path
  end

  def type
    'organization_membership'.freeze
  end
end

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

require 'test_helper'

class OrganizationMembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

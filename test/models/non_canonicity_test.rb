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

require 'test_helper'

class NonCanonicityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

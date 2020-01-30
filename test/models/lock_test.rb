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

require 'test_helper'

class LockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

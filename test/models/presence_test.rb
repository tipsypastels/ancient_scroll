# == Schema Information
#
# Table name: presences
#
#  id             :integer          not null, primary key
#  context        :string
#  presenced_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  location_id    :integer
#  presenced_id   :integer
#

require 'test_helper'

class PresenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

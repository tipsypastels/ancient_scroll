# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  map_type   :integer
#  name       :string
#  population :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

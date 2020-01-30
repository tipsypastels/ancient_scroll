# == Schema Information
#
# Table name: character_presences
#
#  id           :bigint           not null, primary key
#  context      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :integer
#  location_id  :integer
#

require 'test_helper'

class CharacterPresenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

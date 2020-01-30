# == Schema Information
#
# Table name: characters
#
#  id               :bigint           not null, primary key
#  age              :integer
#  gender           :integer
#  name             :string
#  specialty        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  hometown_id      :integer
#  trainer_class_id :integer
#

require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

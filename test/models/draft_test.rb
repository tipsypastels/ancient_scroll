# == Schema Information
#
# Table name: drafts
#
#  id             :bigint           not null, primary key
#  draftable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  draftable_id   :integer
#

require 'test_helper'

class DraftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: identifiers
#
#  id                :bigint           not null, primary key
#  identifiable_type :string
#  slug              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  identifiable_id   :integer
#
# Indexes
#
#  index_identifiers_on_slug  (slug) UNIQUE
#

require 'test_helper'

class IdentifierTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

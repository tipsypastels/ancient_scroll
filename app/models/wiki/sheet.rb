# == Schema Information
#
# Table name: sheets
#
#  id             :bigint           not null, primary key
#  intrinsic_role :string
#  name           :string
#  updated_by     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Wiki::Sheet < ApplicationRecord
  include Wiki::Object
  include Intrinsic

  ICON = :scroll
end

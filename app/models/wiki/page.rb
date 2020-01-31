# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  name       :string
#  updated_by :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wiki::Page < ApplicationRecord
end

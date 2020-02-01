# == Schema Information
#
# Table name: regions
#
#  id         :bigint           not null, primary key
#  name       :string
#  updated_by :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wiki::Region < ApplicationRecord
  include Wiki::Object

  ICON = :globe

  has_many :provinces
  has_many :locations

  api_accessible :show do |api|
    api.add :locations, template: :index
  end

  def name=(name)
    super(name&.delete_suffix(' Region'))
  end
end

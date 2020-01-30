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

class Character < ApplicationRecord
  include Wiki::Object

  has_many :character_presences
  has_many :locations, through: :character_presences

  has_many :organization_memberships
  has_many :organizations, through: :organization_memberships

  belongs_to :trainer_class, optional: true
  belongs_to :hometown, class_name: 'Location', optional: true

  enum gender: {
    female:    0,
    male:      1,
    nonbinary: 2,
  }

  api_accessible :show do |api|
    api.add :age
    api.add :gender
    api.add :pronouns
    api.add :specialty
    
    api.add :trainer_class, template: :index
    api.add :hometown, template: :index
    api.add :locations, template: :index
    api.add :organization_memberships, template: :index
  end

  CHARACTER_PRONOUNS = {
    female:    'She/Her',
    male:      'He/Him',
    nonbinary: 'They/Them',
  }.with_indifferent_access

  def pronouns
    CHARACTER_PRONOUNS[gender]
  end

  def specialty
    super.presence || trainer_class&.specialty
  end

  def modifiable_properties
    %i|age gender trainer_class specialty|
  end
end

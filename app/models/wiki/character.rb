# == Schema Information
#
# Table name: characters
#
#  id               :bigint           not null, primary key
#  age              :integer
#  gender           :integer
#  name             :string
#  slug             :string
#  specialty        :string
#  story_role       :integer
#  updated_by       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  hometown_id      :integer
#  trainer_class_id :integer
#
# Indexes
#
#  index_characters_on_slug  (slug) UNIQUE
#

class Wiki::Character < ApplicationRecord
  include Wiki::Object

  ICON = :portrait

  scope :ordered_by_story_role, -> {
    order(story_role: :desc)
  }

  has_many :character_presences
  has_many :locations, through: :character_presences

  has_many :organization_memberships
  has_many :organizations, through: :organization_memberships

  belongs_to :trainer_class, optional: true
  belongs_to :hometown, class_name: 'Wiki::Location', optional: true

  validates :story_role, presence: true

  enum story_role: {
    npc:         0,
    quest_giver: 1,
    boss:        2,
    main_cast:   3,
    protagonist: 4,
  }

  enum gender: {
    female:    0,
    male:      1,
    nonbinary: 2,
  }

  api_accessible :show do |api|
    api.add :story_role
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

  def membership_in(organization)
    organization_memberships.find_by(organization: organization)
  end
end

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

class Wiki::Identifier < ApplicationRecord
  def self.find_identifiable(id)
    identifier = friendly.find(id)
    identifier.identifiable_type.constantize.find(identifier.identifiable_id)
  end

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :identifiable, polymorphic: true
  delegate :name, to: :identifiable
end

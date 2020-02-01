# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  slug                   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ApplicationRecord
  scope :admins, -> { where(admin: true) }

  include Rails.application.routes.url_helpers
  def default_url_options; {}; end

  extend FriendlyId
  friendly_id :username, use: :slugged

  acts_as_api
  
  api_accessible :index do |api|
    api.add :id
    api.add :username
    api.add :slug
    api.add :path
    api.add :api_path
  end

  api_accessible :show, extend: :index do |api|
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def path
    user_path(slug)
  end

  def api_path
    path + '?format=json'
  end
end

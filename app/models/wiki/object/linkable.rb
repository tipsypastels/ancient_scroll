module Wiki::Object::Linkable
  include Rails.application.routes.url_helpers
  include UrlHelper
  def default_url_options; {}; end

  extend ActiveSupport::Concern

  included do
    api_accessible :index do |api|
      api.add :path
      api.add :api_path
      api.add :image_path
    end
  end

  def path
    wiki_object_path(slug, type: type)
  end

  def api_path
    path + '?format=json'
  end

  def image_path
    return unless image.present?
    rails_blob_path(image, disposition: 'attachment', only_path: true)
  end
end
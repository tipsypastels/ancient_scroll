module Wiki::Object
  include Rails.application.routes.url_helpers
  def default_url_options; {}; end

  extend ActiveSupport::Concern

  included do
    default_scope {
      includes(:lock, :draft)
    }

    scope :published, -> {
      # TODO
      all
      # where <<~SQL
      #   id not in (
      #     select draftable_id from drafts
      #     where draftable_type = \"#{self.class.name}\"
      #   )
      # SQL
    }

    acts_as_api

    api_accessible :index do |api|
      api.add :type
      api.add :id
      api.add :name
      api.add :slug
      api.add :path
      api.add :api_path
      api.add :image_path
      api.add :locked?
      api.add :draft?
    end
    
    api_accessible :show, extend: :index do |api|
      api.add :canonicity
      api.add ->r { r.canonical_content.to_s }, as: :canonical_content
      # api.add :comments
    end

    validates :name, presence: true
    validates :content, presence: true

    has_one :identifier, as: :identifiable
    has_one_attached :image
    has_rich_text :content

    has_one :lock, as: :lockable
    has_one :draft, as: :draftable
    has_one :non_canonicity, as: :object
    has_many :comments, as: :commentable

    private :lock, :draft

    after_create :create_identifier
    delegate :slug, to: :identifier
  end

  def type
    self.class.name.underscore
  end

  def path
    wiki_object_path(slug)
  end

  def api_path
    path + '?format=json'
  end

  def image_path
    return unless image.present?
    rails_blob_path(image, disposition: 'attachment', only_path: true)
  end

  def locked?
    lock.present?
  end

  def draft?
    draft.present?
  end

  def visible?
    true # TODO
  end

  def canonicity
    @canonicity ||= begin
      non_canonicity.presence || Canonicity.new
    end
  end

  def canonical_content
    @canonical_content ||= CanonicalContent.new(self, content)
  end

  def to_form_locals
    {}.tap { |h| h[type.to_sym] = self}
  end

  private

  def create_identifier
    Identifier.create!(identifiable: self) unless identifier
  end
end
module Wiki::Object::Content
  extend ActiveSupport::Concern

  included do
    api_accessible :index do |api|
      api.add :type
      api.add :id
      api.add :name
    end

    api_accessible :show, extend: :index do |api|
      api.add ->r { r.prepared_content.to_s }, as: :prepared_content
    end

    validates :name, presence: true
    validates :content, presence: true

    has_one_attached :image
    has_rich_text :content
  end

  def type
    self.class.name
      .demodulize
      .underscore
  end

  def prepared_content
    @prepared_content ||= Wiki::Object::PreparedContent.new(self, content)
  end
end
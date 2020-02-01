class Wiki::Object::PreparedContent
  include Rails.application.routes.url_helpers

  def initialize(object, content)
    @object  = object
    @content = content
    @links   = {}
  end

  SPOILER_REGEX = /\b(MAJOR_)?SPOILER\((.+?)\)/

  def to_s
    @string ||= content.to_s
      .gsub(Wiki.object_locator.regex(exclude: object.name)) { wrap_object_name($1) }
      .gsub(SPOILER_REGEX) { wrap_spoilers($2, $1.present?) }
      .html_safe
  end

  private

  attr_reader :object, :content, :links

  def wrap_object_name(name)
    slug = Wiki.object_locator.locate(name)
    return name unless slug

    "<a href=\"#{wiki_object_path(slug)}\">#{name}</a>"
  end

  def wrap_spoilers(content, major)
    if major
      <<~HTML
        <div class="major-spoiler">
          <h3 class="major-spoiler__title">
            This section contains a major spoiler.
          </h3>

          <p class="major-spoiler__paragraph">
            Reading this early may significantly impact your enjoyment of the game. If you have not completed the story, please avoid this.
          </p>

          <button class="major-spoiler__button">
            Show Spoiler
          </button>

          <div class="major-spoiler__content">
            #{content}
          </div>
        </div>
      HTML
    else
      <<~HTML
        <span title="Click to reveal spoiler." class="spoiler">
          #{content}
        </span>
      HTML
    end
  end
end
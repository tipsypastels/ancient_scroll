class Wiki::Object::PreparedContent
  include Rails.application.routes.url_helpers

  def initialize(object, content)
    @object  = object
    @content = content
    @links   = {}
  end

  SPOILER_REGEX = /\bSPOILER\((.+?)\)/

  def to_s
    @string ||= content.to_s
      .gsub(Wiki.object_locator.regex(exclude: object.name)) { wrap_object_name($1) }
      .gsub(SPOILER_REGEX) { wrap_spoilers($1) }
      .html_safe
  end

  private

  attr_reader :object, :content, :links

  def wrap_object_name(name)
    slug = Wiki.object_locator.locate(name)
    return name unless slug

    "<a href=\"#{wiki_object_path(slug)}\">#{name}</a>"
  end

  def wrap_spoilers(content)
    "<span title=\"Click to reveal spoiler.\" class=\"spoiler\">#{content}</span>"
  end
end
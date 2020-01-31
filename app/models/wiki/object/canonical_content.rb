class Wiki::Object::CanonicalContent
  include Rails.application.routes.url_helpers

  def initialize(object, content)
    @object  = object
    @content = content
    @links   = {}
  end

  OBJECT_LINKS = {
    LOCATION:      Location,
    CHARACTER:     Character,
    REGION:        Region,
    ITEM:          Item,
    TRAINER_CLASS: TrainerClass,
    ORGANIZATION:  Organization,
  }.with_indifferent_access

  LINK_REGEX = /\b(#{OBJECT_LINKS.keys.join('|')})\((.+?)\)/
  SPOILER_REGEX = /\bSPOILER\((.+?)\)/

  def to_s
    @string ||= content.to_s
      .gsub(Wiki.object_locator.regex(exclude: object.name)) { wrap_object_name($1) }
      .gsub(SPOILER_REGEX) { wrap_spoilers($1) }
      .html_safe
  end

  private

  attr_reader :object, :content, :links

  # TODO dont do this inside html tags
  def wrap_object_name(name)
    slug = Wiki.object_locator.locate(name)
    return name unless slug

    "<a href=\"#{wiki_object_path(slug)}\">#{name}</a>"
  end

  def replace_object_links(object_name, name)
    object_type = OBJECT_LINKS[object_name]

    # only ever link to something once
    return name if links[name.downcase]
    links[name.downcase] = true

    if (object = object_type.find_by(name: name))
      "<a href=\"#{wiki_object_path(object.slug)}\">#{name}</a>"
    else
      # TODO return a redlink of some kind
      name
    end
  end

  def wrap_spoilers(content)
    "<span title=\"Click to reveal spoiler.\" class=\"spoiler\">#{content}</span>"
  end
end
module UrlHelper
  def wiki_objects_path(type:)
    send(:"wiki_#{type.pluralize}_path")
  end

  def wiki_object_path(object, type:)
    send(:"wiki_#{type.singularize}_path", to_slug(object))
  end

  def edit_wiki_object_path(object, type:)
    send(:"edit_wiki_#{type.singularize}_path", to_slug(object))
  end

  private

  def to_slug(object)
    object.respond_to?(:slug) ? object.slug : object
  end
end
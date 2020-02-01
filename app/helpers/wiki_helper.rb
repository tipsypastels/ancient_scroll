module WikiHelper
  def wiki_object_form(object, **opts, &block)
    url = 
      if object.persisted?
        wiki_object_path(object.slug, type: object.type)
      else
        wiki_objects_path(type: object.type)
      end
      

    form_with model: object, 
              url: url, 
              class: "wiki-object-form #{opts.delete(:class)}",
              **opts do |form|
                yield form, url
              end
  end
end
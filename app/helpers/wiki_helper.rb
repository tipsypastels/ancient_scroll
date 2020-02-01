module WikiHelper
  def wiki_object_form(object, **opts, &block)
    url = 
      if object.persisted?
        wiki_object_path(object.slug, type: object.type)
      else
        wiki_objects_path(type: object.type)
      end

    render layout: 'wiki/objects/form', 
           locals: { url: url, object: object, opts: opts }, 
           &block
  end
end
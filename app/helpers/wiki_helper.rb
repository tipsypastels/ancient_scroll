module WikiHelper
  def wiki_object_page(object)
    render partial: 'wiki/objects/object', locals: { object: object }
  end

  def wiki_object_form(object, **opts, &block)
    url = 
      if object.persisted?
        wiki_object_path(object.slug)
      else
        wiki_objects_path
      end
      

    form_with model: object, 
              url: url, 
              class: "wiki-object-form #{opts.delete(:class)}",
              **opts,
              &block
  end
end
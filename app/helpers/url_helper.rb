module UrlHelper
  def wiki_object_type_path_link(name, object_type = name.downcase, **opts)
    path = wiki_objects_path(object_type)
    active = path == request.path || @object&.type == object_type.singularize

    link_to name, 
            path, 
            class: "#{opts.delete(:class)} #{'active' if active}", 
            **opts
  end
end
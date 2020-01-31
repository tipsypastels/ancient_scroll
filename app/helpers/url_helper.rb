module UrlHelper
  def wiki_object_type_path(name, object_type = name.downcase.singularize, **opts)
    active = @object&.type == object_type

    link_to name, 
            wiki_objects_path(object_type), 
            class: "#{opts.delete(:class)} #{'active' if active}", 
            **opts
  end
end
module Wiki::Access
  def can_create_object?
    case Wiki.config.access
    when 'open' then true
    when 'public' then Current.user
    when 'private' then Current.admin
    end
  end

  def can_edit_object?(object)
    # return Current.admin if object.locked? TODO
    can_create_object?
  end

  def authenticate_creator!
    redirect_to wiki_root_path unless can_create_object?
  end

  def authenticate_editor!
    redirect_to @object.path unless can_edit_object?(@object)
  end
end
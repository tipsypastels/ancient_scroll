module InfoboxHelper
  def infobox_for(object)
    infobox = Infobox.new(object)
    properties_proc = INFOBOX_PROPERTIES.fetch(object.type, nil)
    instance_exec(infobox, object, &properties_proc) if properties_proc
    infobox
  end

  INFOBOX_PROPERTIES = {
    character: ->(builder, character) {
      builder.add('Age', character.age, default: 'Unknown')
      builder.add('Gender', character.gender&.humanize, default: 'Unknown')
      builder.add('Hometown', link_to_relation_if_present(character.hometown))
      builder.add('Trainer Class', link_to_relation_if_present(character.trainer_class))
      builder.add('Specialty', character.specialty)
      builder.add('Allegiance', create_organization_memberships(character.organization_memberships))
    }
  }.with_indifferent_access

  private

  def link_to_relation_if_present(relation)
    return unless relation.present?
    link_to(relation.name, relation.path)
  end

  def create_organization_memberships(memberships)
    return unless memberships.present?
    memberships.map { |membership|
      html = link_to(membership.name, membership.path)
      context = [membership.former ? 'Former' : nil, membership.role].compact.join(' ')
      html += " (#{context})" if context.present?
      html
    }.join(', ')
     .html_safe
  end
end
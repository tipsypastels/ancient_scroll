module InfoboxHelper
  def infobox_for(object)
    infobox = Infobox.new(object)
    properties_proc = INFOBOX_PROPERTIES.fetch(object.type, nil)
    instance_exec(infobox, object, &properties_proc) if properties_proc
    infobox
  end

  INFOBOX_PROPERTIES = {
    character: ->(builder, character) {
      builder.add('Story Role', character.story_role&.humanize)
      builder.add('Age', character.age, default: 'Unknown')
      builder.add('Gender', character.gender&.humanize, default: 'Unknown')
      builder.add('Hometown', link_to_relation_if_present(character.hometown), default: 'Unknown')
      builder.add('Trainer Class', link_to_relation_if_present(character.trainer_class))
      builder.add('Specialty', character.specialty)
      builder.add('Allegiance', create_organization_memberships(character.organization_memberships))
    },
    location: ->(builder, location) {
      builder.add('Region', location.region.name)
      builder.add('Map Type', location.map_type.humanize)
      builder.add('Population', location.population) if location.habitable?
      builder.add('Notable Residents', create_character_list(location.residents))
    },
    organization: ->(builder, org) {
      builder.add('Notable Members', create_character_list(org.members) { |character| 
        return unless membership = character.membership_in(org)
        [membership.former ? 'Former' : nil, membership.role].compact.join(' ')
      })
    },
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

  def create_character_list(characters)
    return unless characters.present?

    <<~HTML.html_safe
      <ul>
      #{characters.map { |character|
          context = yield(character) if block_given?

          <<~HTML
            <li>
              #{link_to(character.name, character.path)} 
              #{"(#{context})" if context.present?}
            </li>
          HTML
        }.join}
      </ul>
    HTML
  end
end
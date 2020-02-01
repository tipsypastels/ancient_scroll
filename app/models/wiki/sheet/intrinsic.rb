module Wiki::Sheet::Intrinsic
  extend ActiveSupport::Concern

  def self.match?(url)
    REGEX.match?(url)
  end

  def self.find_sheet(id)
    Wiki::Sheet.find_by(intrinsic_role: id)
  end

  def self.create_missing!
    missing = ROLES - Wiki::Sheet.where(intrinsic_role: ROLES).pluck(:intrinsic_role)
    missing.each { |role|
      Wiki::Sheet.create! name: role.humanize,
                          content: "This is the #{role.humanize} page for this wiki. Click the edit button to begin.",
                          intrinsic_role: role
    }
  end
    
  ROLES = %w|home faq guidelines|
  ROUTE_REGEX = /#{ROLES.join('|')}/

  included do
    validates :intrinsic_role,
      inclusion: { in: ROLES },
      allow_nil: true

    before_destroy :cannot_delete_intrinsic, prepend: true
  end

  def intrinsic?
    intrinsic_role.present?
  end

  def deletable?
    not intrinsic? # && super TODO
  end

  private

  def cannot_delete_intrinsic
    raise "Cannot delete intrinsic pages." unless deletable?
  end
end
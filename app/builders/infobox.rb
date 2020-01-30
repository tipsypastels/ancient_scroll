class Infobox
  attr_reader :object, :properties

  def initialize(object)
    @object = object
    @properties = {}
  end
  
  delegate :name, :image, to: :object

  def image?
    image.present?
  end

  def add(name, value, default: nil)
    value = value.call(self, object) if value.is_a?(Proc)
    value ||= default
    properties[name] = value if value.present?
  end
end
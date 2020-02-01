class Wiki::Object::Locator
  OBJECT_TYPES = [
    Wiki::Character, 
    Wiki::Location, 
    Wiki::Region, 
    Wiki::Item, 
    Wiki::TrainerClass, 
    Wiki::Organization,
    Wiki::Sheet,
  ]

  def initialize
    recache!
  end

  def recache!
    @cache = {}
    @regex_cache = {}

    OBJECT_TYPES.each do |type|
      type.includes(:identifier).find_each(&method(:add))
    end
  end

  def regex(exclude: nil)
    regex_cache[exclude] ||= /\b(#{(cache.keys - Array(exclude)).join('|')})\b(?![^\<\>]*\>)/i
  end

  def locate(object_name)
    cache[object_name]
  end

  def add(object)
    cache[object.name] = object.slug
  end

  def remove(object_or_name)
    name = object_or_name.is_a?(Wiki::Object) ? object_or_name.name : object_or_name
    cache.delete(name)
  end

  private

  attr_reader :cache, :regex_cache
end
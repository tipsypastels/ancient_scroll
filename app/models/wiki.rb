class Wiki
  include Singleton

  CONFIG_FILE = Rails.root.join('config', 'wiki_config.yml')

  def self.configured?
    instance.present?
  end

  def self.config
    raise "Cannot access Wiki config before singleton is set" unless configured?
    instance.config
  end

  class << self 
    delegate :object_locator, to: :instance
  end

  cattr_accessor :singleton
  attr_reader :config, :object_locator

  def initialize
    @config = Config.new(YAML.load(File.read(CONFIG_FILE)))
    @config.validate!
    
    @object_locator = Object::Locator.new
  end
end
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

  cattr_accessor :singleton
  attr_reader :config

  def initialize
    @config = Config.new(YAML.load(File.read(CONFIG_FILE)))
    @config.validate!
  end
end
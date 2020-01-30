class Wiki::Config
  include ActiveModel::Validations

  FIELDS = {
    name: { validates: { presence: true } },
    description: { validates: { presence: true } },
    access: { validates: { presence: { in: %i|public private| } }, inquire: true },
    primary_color: { validates: { presence: true } },
  }

  FIELDS.each do |field, opts|
    if opts.key(:validates)
      validates field, **opts[:validates]
    end

    define_method(field) do
      return @config[field] unless opts[:inquire]
      @config[field].inquiry
    end
  end

  def initialize(config)
    @config = config.with_indifferent_access
  end
end
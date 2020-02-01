class Wiki::Config
  include ActiveModel::Validations

  FIELDS = {
    name: { validates: { presence: true } },
    description: { validates: { presence: true } },
    access: { validates: { presence: { in: %i|open public private| } }, inquire: true },
    primary_color: { validates: { presence: true } },
    primary_icon: { validates: { presence: true } },
    github_url: {},
    provinces: { qmark: true },
  }

  FIELDS.each do |field, opts|
    if opts.key(:validates)
      validates field, **opts[:validates]
    end

    method_name = field
    method_name = :"#{method_name}?" if opts[:qmark]

    define_method(method_name) do
      return @config[field] unless opts[:inquire]
      @config[field].inquiry
    end
  end

  def initialize(config)
    @config = config.with_indifferent_access
  end
end
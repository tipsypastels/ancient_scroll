module Wiki::Object::Canon
  extend ActiveSupport::Concern

  included do
    api_accessible :show do |api|
      api.add :canonicity
    end

    has_one :non_canonicity, as: :object
  end

  def canonicity
    @canonicity ||= non_canonicity.presence || Wiki::Canonicity.new
  end
end
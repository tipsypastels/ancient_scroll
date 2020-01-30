module Wiki::Configurable
  extend ActiveSupport::Concern

  included do
    before_action :ensure_wiki_configured!, unless: :config_controller?
  end

  private

  def ensure_wiki_configured!
    redirect_to admin_config_path unless wiki_configured?
  end

  def ensure_wiki_unconfigured!
    redirect_to root_path if wiki_configured?
  end

  def wiki_configured?
    Wiki.configured?
  end

  def config_controller?
    false
  end
end
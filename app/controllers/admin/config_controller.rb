class Admin::ConfigController < ApplicationController
  before_action :ensure_wiki_unconfigured!

  private

  def config_controller?
    true
  end
end
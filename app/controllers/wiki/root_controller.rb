class Wiki::RootController < ApplicationController
  def index
    redirect_to '/wiki/sheets/home'
  end
end
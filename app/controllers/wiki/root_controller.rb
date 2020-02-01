class Wiki::RootController < ApplicationController
  def index
    redirect_to wiki_object_path('~home')
  end
end
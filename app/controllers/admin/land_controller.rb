class Admin::LandController < ApplicationController
  before_action :authenticate_creator!, only: :index

  def index
    @admins = User.admins
  end
end
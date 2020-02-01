class UsersController < ApplicationController
  before_action :set_user

  def show
    respond_to do |format|
      format.html
      format.json { render_for_api :show, json: @user }
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
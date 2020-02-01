class Wiki::IntrinsicsController < ApplicationController
  def show
    @sheet = Wiki::Sheet::Intrinsic.find_sheet(params[:id])
    redirect_to @sheet
  end
end
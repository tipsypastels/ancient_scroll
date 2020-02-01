class Wiki::ObjectsController < ApplicationController
  before_action :set_object
  before_action :authenticate_editor!, except: %i|show|
  
  def show
    respond_to do |format|
      format.html
      format.json { render_for_api :show, json: @object }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @object.update(object_params)
        format.html { redirect_to wiki_object_path(@object.slug) }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_object
    if Wiki::Sheet::Intrinsic.match?(request.path)
      @object = Wiki::Sheet::Intrinsic.find_sheet(params[:id])
    else
      @object = Wiki::Identifier.find_identifiable(params[:id])
    end
  end

  def object_params
    params.require(:"wiki_#{@object.type}")
          .permit(:name, :image, :content, *@object.modifiable_properties)
  end
end
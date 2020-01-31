class Wiki::ObjectsController < ApplicationController
  before_action :set_object, except: %i|index new create|
  
  def index
    begin
      object_type = params[:object_type].classify.constantize
    rescue
      head :unprocessable_entity
      return
    end

    @objects = object_type.paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render_for_api :index, json: @objects }
    end
  end

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
    @object = Wiki::Identifier.find_identifiable(params[:id])
  end

  def object_params
    params.require(:"wiki_#{@object.type}")
          .permit(:name, :image, :content, *@object.modifiable_properties)
  end
end
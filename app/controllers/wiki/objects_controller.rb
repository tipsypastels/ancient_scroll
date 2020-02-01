class Wiki::ObjectsController < ApplicationController
  include UrlHelper

  before_action :set_object, except: %i|index new create|
  before_action :authenticate_creator!, only: %i|new create|
  before_action :authenticate_editor!, only: %i|edit update|

  def index
    @objects = object_class.paginate(page: params[:page])
                           .as_list_on_category

    @title = scope.humanize
    @new_object_path = send(:"new_wiki_#{singular_scope}_path") if can_create_object?

    respond_to do |format|
      format.html do
        @top4 = @objects[0...4]
        @list = @objects[4..]

        render 'wiki/objects/index'
      end
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
        format.any(:html, :js) { redirect_to wiki_object_path(@object, type: scope) }
        format.json { render_for_api :show, json: @object }
      else
        format.any(:html, :js) { render :edit }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @object = object_class.new
    instance_variable_set("@#{scope}", @object)
  end

  def create
    @object = object_class.new(object_params)

    respond_to do |format|
      if @object.save
        format.any(:html, :js) { redirect_to wiki_object_path(@object, type: scope) }
        format.json { render_for_api :show, json: @object }
      else
        format.any(:html, :js) { render :new }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def object_class
    Wiki::Object.types[scope]
  end

  def singular_scope
    @singular_scope ||= scope.singularize
  end

  def scope; self.class.const_get(:SCOPE).to_s; end
  def modifiable_properties; self.class.const_get(:MODIFIABLE_PROPERTIES); end

  def set_object
    @object = object_class.friendly.find(params[:id])
    instance_variable_set("@#{scope}", @object)
  end

  def object_params
    params.require("wiki_#{singular_scope}")
          .permit(:name, :image, :content, *modifiable_properties)
  end

  # before_action :set_object
  # before_action :authenticate_editor!, except: %i|show|
  
  # def show
  #   respond_to do |format|
  #     format.html
  #     format.json { render_for_api :show, json: @object }
  #   end
  # end

  # def edit
  # end

  # def update
  #   respond_to do |format|
  #     if @object.update(object_params)
  #       format.html { redirect_to wiki_object_path(@object.slug) }
  #       format.json { head :no_content }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @object.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # private

  # def set_object
  #   if Wiki::Sheet::Intrinsic.match?(request.path)
  #     @object = Wiki::Sheet::Intrinsic.find_sheet(params[:id])
  #   else
  #     @object = Wiki::Identifier.find_identifiable(params[:id])
  #   end
  # end

  # def object_params
  #   params.require(:"wiki_#{@object.type}")
  #         .permit(:name, :image, :content, *@object.modifiable_properties)
  # end
end
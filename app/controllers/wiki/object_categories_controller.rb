class Wiki::ObjectCategoriesController < ApplicationController
  before_action :validate_object_class!
  before_action :authenticate_creator!, except: :show

  OBJECT_TYPES = {
    regions: Wiki::Region,
    provinces: Wiki::Province,
    locations: Wiki::Location,
    # quests
    characters: Wiki::Character,
    organizations: Wiki::Organization,
    trainer_classes: Wiki::TrainerClass,
    # pokemon, abilities, moves
  }.with_indifferent_access

  def show
    @objects = @object_class.paginate(page: params[:page]).as_list_on_category
    @category = params[:object_type].humanize

    respond_to do |format|
      format.html {
        @top4 = @objects[0...4]
        @list = @objects[4..]
      }
      format.json { render_for_api :index, json: @objects }
    end
  end

  def new
    @object = @object_class.new
  end

  def create
    @object = @object_class.new(object_params)
    
    respond_to do |format|
      if @object.save
        format.html { redirect_to @object.path }
        format.json { render_for_api :show, json: @object }
      else
        format.html { render :new }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def validate_object_class!
    @object_class = OBJECT_TYPES[params[:object_type]] || not_found
  end

  def object_params
    params.require(:"wiki_#{params[:object_type].singularize}")
      .permit(:name, :image, :content, *@object_class.modifiable_properties)
  end
end
class PropertiesController < ApplicationController
  before_action :set_property,only: %i[:show, :edit, :update, :destroy]
  before_action :authenticate_agent!, only: [:new,:create,:destroy]
  def index
    @properties=Property.all
  end

  def show
   property_id
   @properties=Property.find(params[:id])
   @agents=Agent.all
   @commentable=@properties
   @comments=@commentable.comments if 
   @comment=Comment.new
   if @property.propertytype_id.present?
   @property_type_name = Propertytype.find(@property.propertytype_id).name
   end

  end
   def new
     @property=Property.new 
     @propertytype =Propertytype.all
   end
  def create
    @property = Property.new(property_params)
    
    @property.agent_id=current_agent.id
     respond_to do |format|
      if @property.save
      format.html{redirect_to @property,notice: 'property was succesfully created'}
      format.json{render :show,status: :created,location: @property}
     else
      format.html{render :new}
      format.json{render json:@property.errors, status: :unprocessable_entity}
     end
  end
end
 

  def edit
    property_id
  end
  def update
     property_id
     if @property.update(property_params)
      redirect_to property_path(@property)
     else
      render :edit
     end
  end
  def destroy
    property = Property.find(params[:id])
    property.appointments.destroy_all
    property.comments.destroy_all
    property.images.purge # or property.images.attachments.each(&:purge)
    property.users.destroy_all
    property.destroy
    redirect_to properties_path
  end
  private

  def property_params
    params.require(:property).permit(:name,:descripition,:price,:address,:agent_id , :propertytype_id, images: [])
  end

  def property_id
    @property=Property.find_by(id: params[:id])
  end
end

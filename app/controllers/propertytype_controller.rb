class PropertytypeController < ApplicationController
    before_action :set_property_type, only: [:show, :edit, :update, :destroy]

  def index
    @property_types = Propertytype.all
  end

  def show
  end

  def new
    @property_type = Propertytype.new
    
  end

  def edit
    @property_type=Propertytype.find_by(id: params[:id])

  end

  def create
    @property_type = Propertytype.create(property_type_params)
    if @property_type.save
      redirect_to @property_type, notice: 'Property type was successfully created.'
    else
        if params[:property_type].blank?
            flash.now[:error] = "Please enter a property type name."
        end
      render :new
    end
  end

  def update
    if @property_type.update(property_type_params)
      redirect_to propertytype_index_path, notice: 'Property type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @property_type.destroy
    redirect_to propertytype_index_path, notice: 'Property type was successfully destroyed.'
  end

  private
    def set_property_type
      @property_type = Propertytype.find(params[:id])
    end

    def property_type_params
      params.require(:propertytype).permit(:name)
    end

end

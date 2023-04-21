class Api::V1::PropertiesController < ActionController::API


#   skip_before_action:verify_authenticity_token
  def index
     properties=Property.all
     render json: properties, status:200
  end
  def show
    property = Property.find_by(id: params[:id])
    if property.present?
        render json: property, status: 200
    else
        render json: {error: " property is not exist"}
    end
  end
  def create
    
     property=Property.new(property_params)
     if property.save
        render json: property, status: 200
     else 
        render json: {error: "not saved"},status:422
     end

  end

  def update
    property = Property.find_by(id: params[:id])
          
     if property.nil?
      render json: { message: "Record not found" }, status: :not_found
     elsif  property.update(property_params) 

        render json: property, status: 200
    else
        render json: {error: "not updated"}, status: :unprocessable_entity
    end
  end
  def destroy
    property = Property.find_by(id: params[:id])
    property.destroy
    render json:{message: "Deleted"}
  end
  def property_comments
    property = Property.find(params[:id])
    count1 = property.comments.count
    render json: { no_of_comments_on_properties: count1 }

  end
  def property_appointments
    property=Property.find(params[:id])
    count2=property.appointments.count
    render json:{no_of_appointments_on_properties:count2}
  end
  private
  def property_params
    params.require(:property).permit(:name,:descripition,:price,:address,:agent_id , :propertytype_id, images: [])
  end

end

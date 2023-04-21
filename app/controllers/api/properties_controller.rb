module Api
class Api::PropertiesController < ApplicationController

    def index
        @properties=Property.all 
        render json: {properties: @properties}
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
        @agent = Agent.find(doorkeeper_token.resource_owner_id)
        property= @agent.properties.new(property_params)
        if property.save
           render json: property, status: 200
        else 
           render json: {error: "not saved"}
        end
   
     end
     def update
      #debugger
      property = Property.find_by(id: params[:id])


      if current_agent.is_a? Agent
        if property.agent_id == doorkeeper_token.resource_owner_id
          if property.update(property_params)
            render json: {message: "property id #{property.id} is updated successfully"}
          else
            render json: {message:"property not updated"}
          end
        else
          render json:{error:"unauthorized"},status: :unauthorized
        end
      else
        render json: {error:"You are not allowed to updatee"},status: 403
      end
    end



    def destroy
      #debugger
      property=Property.find_by(id: params[:id])
     if property.present?
      if current_agent.is_a? Agent
         if property.agent_id == doorkeeper_token.resource_owner_id

          if property.destroy
            render json: {message: "property deleted"}
          else
            render json: {message:"Property not deleted"}
          end
        else
           render json:{error:"unauthorized"},status: :unauthorized
        end
      else
        render json: {message:"You are not allowed to delete"},status: 403
      end
     else 
        render json: {message:"message-not-found"}
     end
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
end

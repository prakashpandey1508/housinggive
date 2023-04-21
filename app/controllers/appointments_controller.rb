class AppointmentsController < ApplicationController
# before_action :authenticate_account!, only: [:edit, :update, :destroy]
before_action :set_appointment, only: [:show, :edit, :update, :destroy]
#before_action :unauthorize_account, only: [:show, :edit, :update, :destroy]

def index
  if current_agent.present?
    @appointments = Appointment.joins(:property).where("properties.agent_id = ?", current_agent.id)
                               .includes(:agent, :property)
  elsif current_user.present?
    @appointments = Appointment.where(user_id: current_user.id)
                               .includes(:agent, :property)
  end
end

def new
  @appointment = Appointment.new
  @agents = Agent.all
  @property = Property.find(params[:property_id])
  @appointment.property_id = @property.id
end

def create
  @appointment = current_user.appointments.new(appointment_params)
  
  @appointment.property_id = params[:property_id]

  
  if @appointment.save
    redirect_to property_path(@appointment.property_id), notice: "Appointment created successfully."
  else
    @agents = Agent.all
    @property = Property.find(params[:property_id])
    
    render :new
  end
end
def edit
  @appointment = Appointment.find(params[:id])
  @agents = Agent.all
end


def update
  @appointment = Appointment.find(params[:id])
  if @appointment.update(appointment_params)
    redirect_to appointments_path, notice: "Appointment updated successfully."
  else
    @agents = Agent.all
    render :edit
  end
end

def show
  @property = @appointment.property

  if current_agent.present? && current_agent.id == @property.agent_id
    @appointments = current_agent.appointments.all
  elsif current_user.present?
    @appointments = current_user.appointments.all
  end
end

def destroy
  @appointment.destroy
  redirect_to appointments_path, notice: "Appointment deleted successfully."
end

# def properties_appointment
#   byebug
#   @property = Property.find_by(id: params[:id])
#   if current_agent.present?
#     @appointments = Appointment.joins(:property).where("appointment.property_id = ?", @property.id)
#                                .includes(:agent, :property)
#                                render :index
#   elsif current_user.present?
#     @appointments = Appointment.where(user_id: current_user.id)
#                                .includes(:agent, :property)
#   end
# end

# def unauthorize_account(@appointment)
#   user_appoint_id = @appointment.pluck(:user_id) if current_user.present?
#   agent_appoint_id = @appointment.pluck(:agent_id) if current_agent.present?
#   redirect_to root_path, alert: "Access denied." unless user_appoint_id.include?(current_user.id)  || agent_appoint_id.include?(current_agent.id)
# end

private

def set_appointment

  @appointment = Appointment.find(params[:id])
end

def appointment_params
  params.require(:appointment).permit(:user_id, :agent_id, :date, :property_id)
end




end

class AppointmentsController < ApplicationController
# before_action :authenticate_account!, only: [:edit, :update, :destroy]
before_action :set_appointment, only: [:edit, :update, :destroy]
 #before_action :unauthorize_account, only: [:show, :edit, :update, :destroy]

def index
  if current_agent.present?
    @appointments = Appointment.where(agent_id: current_agent.try(:id))
  elsif current_user.present?
    @appointments = Appointment.where(user_id: current_user.try(:id)) 
  end
end

def new
  @appointment = Appointment.new
  @agents = Agent.all
end

def create
  @appointment = current_user.appointments.new(appointment_params)
  if @appointment.save

    redirect_to appointments_path, notice: "Appointment created successfully."
  else
    @agents = Agent.all
    render :new
  end
end

def edit
  @agents = Agent.all
  @appointment = Appointment.find_by(params[:id])
end

def update
  if @appointment.update(appointment_params)
    redirect_to appointments_path, notice: "Appointment updated successfully."
  else
    @agents= Agent.all
    render :edit
  end
end

def show
  
  if current_agent.present?
    @appointments = current_agent.appointments.all
  elsif current_user.present?
    @appointments = current_user.appointments.all
  end
end

def destroy
  @appointment.destroy
  redirect_to appointments_path, notice: "Appointment deleted successfully."
end

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
  params.require(:appointment).permit(:user_id, :agent_id, :date)
end

end

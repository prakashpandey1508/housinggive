class Api::V1::AppointmentsController < ActionController::API


  def index
    appointments=Appointment.all
     render json: appointments, status:200
  end

  def show
    appointments=Appointment.find_by(id: params[:id])
    if appointments.present?
      render json: appointments, status:200
    else
      render json: {error: "there is not appointments"}
    end
  end

  def create
    appointments=Appointment.new(appointment_params)
    if appointments.save
      render json:appointments, status:200
    else
      render json:{error:"appointment is already exists"}
    end
  end
  def update
    appointments=Appointment.find_by(id: params[:id])
    if appointments.update(appointment_params)
      render json:appointments, status:200
    else
      render json:{error: "appointment is not update"}
    end
  end
  def destroy
    appointments=Appointment.find_by(id: params[:id])
     appointments.destroy
     render json:appointments

  end
  private
  def appointment_params
    params.require(:appointment).permit(:user_id, :agent_id, :date, :property_id)
  end
end

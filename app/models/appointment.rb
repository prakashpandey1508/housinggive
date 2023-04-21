class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :agent 
  belongs_to :property
  validate :appointment_date_cannot_be_in_the_past
  before_create :check_existing_appointment
def appointment_date_cannot_be_in_the_past
  if date.present? && date < Date.today
    errors.add(:date, "can't be in the past")
  end
end
def check_existing_appointment
  if Appointment.exists?(property_id: property_id, user_id: user_id)
    errors.add(:base, "You already have an appointment for this property.")
    throw :abort
  end
end

end

















class AddPropertyIdToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :property, null: false, foreign_key: true
  end
end

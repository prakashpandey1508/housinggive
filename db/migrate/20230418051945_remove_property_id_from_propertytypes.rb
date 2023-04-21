class RemovePropertyIdFromPropertytypes < ActiveRecord::Migration[6.1]
  def change
    remove_column :propertytypes, :property_id, :integer
  end
end

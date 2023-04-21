class AddFkToPropertytypes < ActiveRecord::Migration[6.1]
  def change
    add_column :propertytypes, :property_id, :integer

  end
end

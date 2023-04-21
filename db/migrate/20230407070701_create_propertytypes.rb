class CreatePropertytypes < ActiveRecord::Migration[6.1]
  def change
    create_table :propertytypes do |t|
      t.string :name

      t.timestamps
    end
  end
end

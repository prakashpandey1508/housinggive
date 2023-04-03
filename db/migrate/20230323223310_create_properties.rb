class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :descripition
      t.integer :price
      t.string :address
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end

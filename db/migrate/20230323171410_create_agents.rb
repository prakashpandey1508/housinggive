class CreateAgents < ActiveRecord::Migration[6.1]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :email
      t.integer :number
      t.string :address
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCarparks < ActiveRecord::Migration[5.2]
  def change
    create_table :carparks do |t|
      t.string :location, null: false
      t.integer :available, null: false
      t.integer :total, null: false
      t.integer :green, null: false
      t.integer :disabled, null: false

      t.timestamps
    end
  end
end

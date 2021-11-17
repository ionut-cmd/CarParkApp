class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :location, null: false
      t.string :bay_type, null: false
      t.string :vehicle_registration, null: false
      t.time :start, null: false
      t.integer :duration, null: false

      t.timestamps
    end
  end
end

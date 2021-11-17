class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :type, null: false
      t.string :vehicle_registration, null: false
      t.datetime :start
      t.integer :duration, null: false

      t.timestamps
    end
  end
end

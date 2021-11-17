class AddIndexToReservations < ActiveRecord::Migration[5.2]
  def change
    add_index :reservations, :location, unique: true
  end
end

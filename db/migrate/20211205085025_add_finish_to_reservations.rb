class AddFinishToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :fisnish, :time, null: false
  end
end

class AddPriceToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :price, :decimal, :precision => 5, :scale => 2
  end
end

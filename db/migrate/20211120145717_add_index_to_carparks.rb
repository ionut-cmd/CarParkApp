class AddIndexToCarparks < ActiveRecord::Migration[5.2]
  def change
    add_index :carparks, :location, unique: true
  end
end

class AddUsersToReservations < ActiveRecord::Migration[5.2]
  def up
    add_reference :reservations, :user, index: true
    Reservation.reset_column_information
    user = User.first

    Reservation.all.each do |reservation|
      reservation.user_id = user.id
      reservation.save!
    end
    change_column_null :reservations, :user_id, false
    add_foreign_key :reservations, :users
  end

  def down
    remove_foreign_key :reservations, :users
    remove_reference :reservations, :user, index: true
  end
end

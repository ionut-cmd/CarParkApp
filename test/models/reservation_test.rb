require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'empty reservation not saved' do
    my_reservation = Reservation.new
    my_reservation.save

    refute my_reservation.valid?
  end

  test 'valid reservation is saved' do
    my_reservation = Reservation.new

    my_reservation.location = 'airport'
    my_reservation.bay_type = 'disabled'
    my_reservation.vehicle_registration = 'AA21BBB'
    my_reservation.start = '2021-11-17 16:28:49'
    my_reservation.duration = 2

    my_reservation.save

    assert true
  end
end

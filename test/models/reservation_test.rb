require 'test_helper'

class ReservationTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  # test "the truth" do
  #   assert true
  # end
  setup do
    @carpark = carparks(:one)
    @user = users(:one)
    sign_in @user
    # @my_reservation = reservations(:one)

  end

  test 'empty reservation not saved' do
    my_reservation = Reservation.new
    my_reservation.location = 'test1'
    my_reservation.bay_type = 'normal'
    my_reservation.start = '2021-11-17 20:28:49'
    my_reservation.user = @user
    my_reservation.save


    refute my_reservation.valid?
  end

  test 'valid reservation is saved' do
    my_reservation = Reservation.new

    my_reservation.location = 'test1'
    my_reservation.bay_type = 'normal'
    my_reservation.vehicle_registration = 'AA10BBB'
    my_reservation.start = '2021-11-17 20:28:49'
    my_reservation.duration = 1
    my_reservation.user = @user

    my_reservation.save

    assert my_reservation.valid?
  end
end

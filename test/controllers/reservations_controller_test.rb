require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do

    @reservation = reservations(:one)
    @user = users(:one)
    sign_in @user

  end

  test "should get index" do
    get reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_url
    assert_response :success
  end

  test "should create reservation" do
    # increase the start time for each reservation created 
    add_time = 30
    assert_difference('Reservation.count') do
      add_time = add_time * 2
      post reservations_url, params: { reservation: { bay_type: @reservation.bay_type, duration: @reservation.duration, location: @reservation.location, start: @reservation.start+ add_time.minutes, vehicle_registration: @reservation.vehicle_registration} }
    end

    assert_redirected_to reservation_url(Reservation.last)
  end

  test "should show reservation" do
    get reservation_url(@reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_url(@reservation)
    assert_response :success
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: { bay_type: @reservation.bay_type, duration: @reservation.duration, location: @reservation.location, start: @reservation.start, vehicle_registration: @reservation.vehicle_registration } }
    assert_redirected_to reservation_url(@reservation)
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end

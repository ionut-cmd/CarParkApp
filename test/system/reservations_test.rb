require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "creating a Reservation" do
    visit reservations_url
    click_on "New Reservation"

    fill_in "Bay type", with: @reservation.bay_type
    fill_in "Duration", with: @reservation.duration
    fill_in "Location", with: @reservation.location
    fill_in "Start", with: @reservation.start
    fill_in "Vehicle registration", with: @reservation.vehicle_registration
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "updating a Reservation" do
    visit reservations_url
    click_on "Edit", match: :first

    fill_in "Bay type", with: @reservation.bay_type
    fill_in "Duration", with: @reservation.duration
    fill_in "Location", with: @reservation.location
    fill_in "Start", with: @reservation.start
    fill_in "Vehicle registration", with: @reservation.vehicle_registration
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation" do
    visit reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation was successfully destroyed"
  end
end

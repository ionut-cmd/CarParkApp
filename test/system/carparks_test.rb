require "application_system_test_case"

class CarparksTest < ApplicationSystemTestCase
  setup do
    @carpark = carparks(:one)
  end

  test "visiting the index" do
    visit carparks_url
    assert_selector "h1", text: "Carparks"
  end

  test "creating a Carpark" do
    visit carparks_url
    click_on "New Carpark"

    fill_in "Available", with: @carpark.available
    fill_in "Disabled", with: @carpark.disabled
    fill_in "Green", with: @carpark.green
    fill_in "Location", with: @carpark.location
    fill_in "Total", with: @carpark.total
    click_on "Create Carpark"

    assert_text "Carpark was successfully created"
    click_on "Back"
  end

  test "updating a Carpark" do
    visit carparks_url
    click_on "Edit", match: :first

    fill_in "Available", with: @carpark.available
    fill_in "Disabled", with: @carpark.disabled
    fill_in "Green", with: @carpark.green
    fill_in "Location", with: @carpark.location
    fill_in "Total", with: @carpark.total
    click_on "Update Carpark"

    assert_text "Carpark was successfully updated"
    click_on "Back"
  end

  test "destroying a Carpark" do
    visit carparks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carpark was successfully destroyed"
  end
end

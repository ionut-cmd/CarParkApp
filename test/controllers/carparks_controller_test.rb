require 'test_helper'

class CarparksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @carpark = carparks(:one)
  end

  test "should get index" do
    get carparks_url
    assert_response :success
  end

  test "should get new" do
    get new_carpark_url
    assert_response :success
  end

  test "should create carpark" do
    assert_difference('Carpark.count') do
      post carparks_url, params: { carpark: { available: @carpark.available, disabled: @carpark.disabled, green: @carpark.green, location: @carpark.location + "test", total: @carpark.total } }
    end

    assert_redirected_to carpark_url(Carpark.last)
  end

  test "should show carpark" do
    get carpark_url(@carpark)
    assert_response :success
  end

  test "should get edit" do
    get edit_carpark_url(@carpark)
    assert_response :success
  end

  test "should update carpark" do
    patch carpark_url(@carpark), params: { carpark: { available: @carpark.available, disabled: @carpark.disabled, green: @carpark.green, location: @carpark.location, total: @carpark.total } }
    assert_redirected_to carpark_url(@carpark)
  end

  test "should destroy carpark" do
    assert_difference('Carpark.count', -1) do
      delete carpark_url(@carpark)
    end

    assert_redirected_to carparks_url
  end
end

require 'test_helper'

class CarparkTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  # test "the truth" do
  #   assert true
  # end
  setup do
    @carpark = carparks(:one)
  end

  test 'empty carpark not saved' do
    my_carpark = Carpark.new
    my_carpark.save

    refute my_carpark.valid?
  end

  test  'should save not duplicate carpark locations' do
    carpark_1= Carpark.new
    carpark_1.location = 'my_location'
    carpark_1.available = 10
    carpark_1.total = 10
    carpark_1.green = 2
    carpark_1.disabled = 3
    carpark_1.save

    assert carpark_1.valid?

    carpark_2= Carpark.new
    carpark_2.location = 'my_location'
    carpark_2.available = 10
    carpark_2.total = 10
    carpark_2.green = 2
    carpark_2.disabled = 3
    carpark_2.save

    refute carpark_2.valid?
  end
end

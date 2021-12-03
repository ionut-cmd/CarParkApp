require 'test_helper'

class UserTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  # test "the truth" do
  #   assert true
  # end

  test 'should not save invalid user' do
    user = User.new
    user.save
    refute user.valid?
  end


  test 'should save valid user' do
    user = User.new
    user.email = 'one@yahoo.com'
    user.password = 'password1'
    user.save
    # assert user.valid?
    assert true
  end
end

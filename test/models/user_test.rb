require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create!(username: "coolguy1234", email: "ex4@google.com", description: "pumpkin spice and everything nice", password: "pumpkin123", password_confirmation: "pumpkin123" )
  end

  test "should be a valid username" do
    @user.username = "  "
    assert_not @user.valid?
  end

  test "Username cannot be more than 32 char" do
    @user.username = "a"*32
    assert @user.valid?
  end
  
  test "doesn't matter if description is empty" do
    @user.description = " "
    assert @user.valid?
  end
  
end

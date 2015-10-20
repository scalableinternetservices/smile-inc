require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create!(username: "coolguy1234", email: "ex4@google.com", description: "pumpkin spice and everything nice", password: "pumpkin123", password_confirmation: "pumpkin123" )
  end

  test "should be a valid username" do
    @user.username = "  "
    assert_not @user.valid?
  end

  test "should have something under description" do
    @user.description = " "
    assert_not @user.valid?
  end
  
end

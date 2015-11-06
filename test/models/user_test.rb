require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has user profile" do
    u = User.create(email: "user@test.com")
    u.profile.exists?
  end
end

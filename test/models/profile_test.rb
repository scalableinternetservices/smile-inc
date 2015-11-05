require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test "belongs to a user" do
    profile = Profile.new
    assert profile.invalid?
    assert profile.errors[:user].any?
    profile.user = User.new
    assert profile.valid?
  end

end

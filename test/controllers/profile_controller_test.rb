require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get profile_page" do
    get :profile_page
    assert_response :success
  end

end

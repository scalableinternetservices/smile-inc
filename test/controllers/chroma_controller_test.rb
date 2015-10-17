require 'test_helper'

class ChromaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

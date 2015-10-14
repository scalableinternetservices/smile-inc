require 'test_helper'

class MoodUpdatesControllerTest < ActionController::TestCase
  setup do
    @mood_update = mood_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mood_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mood_update" do
    assert_difference('MoodUpdate.count') do
      post :create, mood_update: { desc: @mood_update.desc, intensity: @mood_update.intensity, mood_id: @mood_update.mood_id }
    end

    assert_redirected_to mood_update_path(assigns(:mood_update))
  end

  test "should show mood_update" do
    get :show, id: @mood_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mood_update
    assert_response :success
  end

  test "should update mood_update" do
    patch :update, id: @mood_update, mood_update: { desc: @mood_update.desc, intensity: @mood_update.intensity, mood_id: @mood_update.mood_id }
    assert_redirected_to mood_update_path(assigns(:mood_update))
  end

  test "should destroy mood_update" do
    assert_difference('MoodUpdate.count', -1) do
      delete :destroy, id: @mood_update
    end

    assert_redirected_to mood_updates_path
  end
end

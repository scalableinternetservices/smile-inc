require 'test_helper'

class UserEditProfileTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "Access profile page" do
    get profile_path(users(:one))
    assert_response :success
  end

  test "Access edit page from profile page" do
    get profile_path(users(:one))
    assert_select "a[href=?]", edit_profile_path
  end

    
  test "unsuccessful edit" do
    get edit_profile_path(users(:two))
    assert_template 'profiles/edit'
    patch edit_profile_path(users(:one)), user: { name:  "",
                                    email: "foo@invalid",
                                    password:              "foo",
                                    password_confirmation: "bar" }
    assert_template 'profiles/edit'
  end

end

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get user_profile" do
    get users_user_profile_url
    assert_response :success
  end

  test "should get user_plushes" do
    get users_user_plushes_url
    assert_response :success
  end

end

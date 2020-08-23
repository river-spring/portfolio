require 'test_helper'

class Users::FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_friends_index_url
    assert_response :success
  end

end

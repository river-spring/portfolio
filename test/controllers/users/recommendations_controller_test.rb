require 'test_helper'

class Users::RecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_recommendations_show_url
    assert_response :success
  end

  test "should get new" do
    get users_recommendations_new_url
    assert_response :success
  end

end

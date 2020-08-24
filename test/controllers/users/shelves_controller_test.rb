require 'test_helper'

class Users::ShelvesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_shelves_show_url
    assert_response :success
  end

  test "should get new" do
    get users_shelves_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_shelves_edit_url
    assert_response :success
  end

end

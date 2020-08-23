require 'test_helper'

class Users::GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_groups_index_url
    assert_response :success
  end

  test "should get new" do
    get users_groups_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_groups_edit_url
    assert_response :success
  end

end

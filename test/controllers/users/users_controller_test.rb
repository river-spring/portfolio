require 'test_helper'

class Users::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get users_users_show_url
    assert_response :success
  end

  test 'should get edit' do
    get users_users_edit_url
    assert_response :success
  end

  test 'should get update' do
    get users_users_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get users_users_destroy_url
    assert_response :success
  end

  test 'should get quit' do
    get users_users_quit_url
    assert_response :success
  end

  test 'should get quit_update' do
    get users_users_quit_update_url
    assert_response :success
  end
end

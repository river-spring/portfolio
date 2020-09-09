require 'test_helper'

class Users::ProductionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get users_productions_show_url
    assert_response :success
  end

  test 'should get new' do
    get users_productions_new_url
    assert_response :success
  end

  test 'should get create' do
    get users_productions_create_url
    assert_response :success
  end

  test 'should get edit' do
    get users_productions_edit_url
    assert_response :success
  end

  test 'should get update' do
    get users_productions_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get users_productions_destroy_url
    assert_response :success
  end
end

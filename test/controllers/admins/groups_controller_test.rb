require 'test_helper'

class Admins::GroupsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admins_groups_index_url
    assert_response :success
  end
end

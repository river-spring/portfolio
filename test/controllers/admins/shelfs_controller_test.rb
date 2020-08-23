require 'test_helper'

class Admins::ShelfsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_shelfs_index_url
    assert_response :success
  end

end

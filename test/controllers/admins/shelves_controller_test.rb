require 'test_helper'

class Admins::ShelvesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_shelves_index_url
    assert_response :success
  end

end

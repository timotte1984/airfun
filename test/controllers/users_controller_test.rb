require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get users_resources_url
    assert_response :success
  end

end

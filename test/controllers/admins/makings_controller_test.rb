require "test_helper"

class Admins::MakingsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_makings_update_url
    assert_response :success
  end
end

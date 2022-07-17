require "test_helper"

class Admins::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admins_orders_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_orders_update_url
    assert_response :success
  end
end

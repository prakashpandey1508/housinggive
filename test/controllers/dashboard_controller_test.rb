require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get properties" do
    get dashboard_properties_url
    assert_response :success
  end

  test "should get report" do
    get dashboard_report_url
    assert_response :success
  end
end

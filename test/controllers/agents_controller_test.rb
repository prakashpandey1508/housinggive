require "test_helper"

class AgentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agents_index_url
    assert_response :success
  end

  test "should get new" do
    get agents_new_url
    assert_response :success
  end

  test "should get show" do
    get agents_show_url
    assert_response :success
  end

  test "should get edit" do
    get agents_edit_url
    assert_response :success
  end
end

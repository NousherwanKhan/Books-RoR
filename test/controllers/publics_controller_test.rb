require "test_helper"

class PublicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_show_url
    assert_response :success
  end
end

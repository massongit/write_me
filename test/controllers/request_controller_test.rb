require 'test_helper'

class RequestControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get request_add_url
    assert_response :success
  end

  test "should get chenge" do
    get request_chenge_url
    assert_response :success
  end

  test "should get delete" do
    get request_delete_url
    assert_response :success
  end

end

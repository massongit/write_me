require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get request_show_url
    assert_response :success
  end

  test "should get edit" do
    get request_edit_url
    assert_response :success
  end

  test "should get add" do
    get request_add_url
    assert_response :success
  end

  test "should get change" do
    get request_change_url
    assert_response :success
  end

  test "should get delete" do
    get request_delete_url
    assert_response :success
  end

end

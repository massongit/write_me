# frozen_string_literal: true

require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  fixtures :requests

  setup do
    @one = requests(:one)
    @one.save!
  end

  test 'should get index' do
    get requests_url
    assert_response :success
  end

  test 'should post create' do
    post requests_url, params: {request: @one.attributes}
    assert_redirected_to root_path(locale: :en)
  end

  test 'should get new' do
    get new_request_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_request_url(id: @one.id)
    assert_response :success
  end

  test 'should get show' do
    get request_url(id: @one.id)
    assert_response :success
  end

  test 'should patch update' do
    patch request_url(id: @one.id), params: {request: @one.attributes}
    assert_redirected_to root_path(locale: :en)
  end

  test 'should put update' do
    put request_url(id: @one.id), params: {request: @one.attributes}
    assert_redirected_to root_path(locale: :en)
  end

  test 'should delete destroy' do
    delete request_url(id: @one.id)
    assert_redirected_to root_path(locale: :en)
  end
end

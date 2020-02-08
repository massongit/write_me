# frozen_string_literal: true

require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest

  test 'should get index' do
    get requests_url, params: { locale: 'ja' }
    assert_response :success
  end

  test 'should post create' do
    post new_request_url, params: { locale: 'ja' }
    assert_response :success
  end

  test 'should get new' do
    get new_request_url, params: { locale: 'ja' }
    assert_response :success
  end

  test 'should get edit' do
    get edit_request_url, params: { locale: 'ja' }
    assert_response :success
  end

  test 'should get show' do
    get request_url, params: { locale: 'ja' }
    assert_response :success
  end

  test 'should patch update' do
    patch requests_url, params: { locale: 'ja' }
    assert_response :success
  end

  test 'should put update' do
    put requests_url, params: { locale: 'ja' }
    assert_response :success
  end

  test 'should delete destroy' do
    delete request_url, params: { locale: 'ja' }
    assert_response :success
  end
end

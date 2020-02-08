# frozen_string_literal: true

require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'Set locale to en if locale is not specified in both path, params and HTTP_ACCEPT_LANGUAGE' do
    get root_path
    assert_equal I18n.locale, :en
  end

  test 'Set locale to ja if locale is set to ja in params' do
    get root_path, params: {locale: 'ja'}
    assert_equal I18n.locale, :ja
  end

  test 'Set locale to ja if locale is set to ja in path' do
    get '/ja'
    assert_equal I18n.locale, :ja
  end

  test 'Set locale to ja if locale is set to ja in HTTP_ACCEPT_LANGUAGE' do
    get '/', headers: {"Accept-Language" => "ja-jp, en-us"}
    assert_equal I18n.locale, :ja
  end

  test 'Set locale to en if locale is specified in params' do
    get root_path, params: {locale: 'en'}
    assert_equal I18n.locale, :en
  end

  test 'Set locale to en if locale is specified in path' do
    get '/en'
    assert_equal I18n.locale, :en
  end
end

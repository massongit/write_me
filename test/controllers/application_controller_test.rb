# frozen_string_literal: true

require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'set locale to en if locale is not specified in both path, params and HTTP_ACCEPT_LANGUAGE' do
    get root_path
    assert_equal I18n.locale, :en
  end

  test 'set locale to en if unsupported locale is set in HTTP_ACCEPT_LANGUAGE' do
    get '/', headers: {"Accept-Language" => "zh-cn"}
    assert_equal I18n.locale, :en
  end

  test 'set locale to ja if locale is set to ja in params 1' do
    get root_path(locale: 'ja')
    assert_equal I18n.locale, :ja
  end

  test 'set locale to ja if locale is set to ja in params 2' do
    get root_path, params: {locale: 'ja'}
    assert_equal I18n.locale, :ja
  end

  test 'set locale to ja if locale is set to ja in path' do
    get '/ja'
    assert_equal I18n.locale, :ja
  end

  test 'set locale to ja if locale is set to ja in HTTP_ACCEPT_LANGUAGE' do
    get '/', headers: {"Accept-Language" => "ja-jp, en-us"}
    assert_equal I18n.locale, :ja
  end

  test 'set locale to en if locale is set to en in params 1' do
    get root_path(locale: 'en')
    assert_equal I18n.locale, :en
  end

  test 'set locale to en if locale is set to en in params 2' do
    get root_path, params: {locale: 'en'}
    assert_equal I18n.locale, :en
  end

  test 'set locale to en if locale is set to en in path' do
    get '/en'
    assert_equal I18n.locale, :en
  end

  test 'set locale to en if locale is set to en in HTTP_ACCEPT_LANGUAGE' do
    get '/', headers: {"Accept-Language" => "en-us, ja-jp"}
    assert_equal I18n.locale, :en
  end
end

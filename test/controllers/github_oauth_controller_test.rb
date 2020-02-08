require 'test_helper'

class GithubOauthControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    @user = users(:one)
    login_as(@user, scope: :user)
  end

  test "should get index" do
    get github_oauth_index_url
    assert_response :success
  end

end

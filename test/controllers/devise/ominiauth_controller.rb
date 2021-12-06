# frozen_string_literal: true

require 'test_helper'

class OmniauthTest < ActionDispatch::IntegrationTest
  setup do
    OmniAuth.config.test_mode = true
    @github_omniauth = OmniAuth::AuthHash.new(Faker::Omniauth.github)
    OmniAuth.config.mock_auth[:github] = @github_omniauth
  end

  test 'test Github OmniAuth Authorize' do
    post user_github_omniauth_authorize_url

    assert_response :redirect
  end

  test 'test Github OmniAuth Callback' do
    user_count = User.count
    post user_github_omniauth_callback_url

    assert_response :redirect
    assert_equal (user_count + 1), User.count
    assert_new_user_info(@github_omniauth, User.last)
  end

  def assert_new_user_info(profile, user)
    assert_equal profile.provider, user.provider
    assert_equal profile.info.email, user.email
    assert_equal profile.info.nickname, user.pseudo
    assert_equal profile.uid, user.uid
  end
end

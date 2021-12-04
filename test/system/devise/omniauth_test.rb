# frozen_string_literal: true

require 'application_system_test_case'

class OmniauthTest < ApplicationSystemTestCase
  setup do
    OmniAuth.config.test_mode = true
    @github_omniauth = OmniAuth::AuthHash.new(Faker::Omniauth.github)
    OmniAuth.config.mock_auth[:github] = @github_omniauth
  end

  test 'test Github OmniAuth' do
    user_count = User.count
    visit new_user_session_url
    click_on 'Sign in with GitHub'

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

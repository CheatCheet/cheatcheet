# frozen_string_literal: true

require 'test_helper'

module Devise
  class CallbacksControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    def omniauth_request(_opts = {})
      default = { provider: :github,
                  uuid: '1234',
                  github: { email: 'foobar@example.com',
                            gender: 'Male',
                            first_name: 'foo',
                            last_name: 'bar' } }

      credentials = default.merge(opts)
      provider = credentials[:provider]
      user_hash = credentials[provider]

      omniauth(provider, credentials, user_hash)
    end

    def omniauth(provider, credentials, user_hash)
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[provider] = {
        'uid' => credentials[:uuid],
        'extra' => { 'user_hash' => { 'email' => user_hash[:email],
                                      'first_name' => user_hash[:first_name],
                                      'last_name' => user_hash[:last_name],
                                      'gender' => user_hash[:gender] } }
      }
    end

    test 'Test Github authentication' do
      post user_github_omniauth_authorize_url
    end
  end
end

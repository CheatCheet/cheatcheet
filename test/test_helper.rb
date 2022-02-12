# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def log_as(user_role)
      user = users(user_role)

      visit new_user_session_url
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
      click_on 'Sign in'

      assert_text 'Signed in successfully.'
    end
  end
end

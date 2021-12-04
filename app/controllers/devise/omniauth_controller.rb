# frozen_string_literal: true

module Devise
  class OmniauthController < OmniauthCallbacksController
    def github
      @user = User.from_omniauth(request.env['omniauth.auth'])
      sign_in_and_redirect @user
      # TODO: flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    end
  end
end

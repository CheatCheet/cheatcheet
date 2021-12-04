# frozen_string_literal: true

module Devise
  class CallbacksController < OmniauthCallbacksController
    def github
      @user = User.from_omniauth(request.env['omniauth.auth'])
      sign_in_and_redirect @user
    end
  end
end

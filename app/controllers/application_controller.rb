# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      respond_to do |format|
        format.json { head :forbidden }
        format.turbo_stream do
          flash.now[:alert] = 'You have to log in to continue.'
          render_flash
        end
        format.html do
          session[:next] = request.fullpath
          redirect_to new_user_session_url, alert: 'You have to log in to continue.'
        end
      end
    else
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to main_app.root_url, alert: exception.message }
      end
    end
  end

  def render_flash
    render turbo_stream: turbo_stream.update('flash', partial: 'shared/flash')
  end
end

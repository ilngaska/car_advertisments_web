# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    return unless session[:user_email]

    if defined?(@current_user)
      @current_user
    else
      @current_user = User.find_by(email: session[:user_email])
    end
  end

  def logged_in?
    current_user.present?
  end
end

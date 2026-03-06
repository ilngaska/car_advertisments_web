# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = UserManager.new.authenticate(params[:email], params[:password])

    if user
      login_and_redirect(user)
    else
      invalid_login_response
    end
  end

  def destroy
    session[:user_email] = nil
    redirect_to cars_path, notice: t('alerts.logout_success')
  end

  private

  def login_and_redirect(user)
    session[:user_email] = user.email
    redirect_to root_path, notice: t('alerts.login_success')
  end

  def invalid_login_response
    flash.now[:alert] = t('alerts.invalid_auth')
    render :new, status: :unprocessable_content
  end
end
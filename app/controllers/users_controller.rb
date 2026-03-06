# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('alerts.signup_success')
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def user_params
    params.expect(user: %i[email password password_confirmation])
  end
end

# frozen_string_literal: true

class SearchHistoriesController < ApplicationController
  def index
    user = UserManager.new.find_user(session[:user_email])

    if user
      @search_histories = user.search_histories.order(created_at: :desc)
    else
      redirect_to new_session_path, alert: t('alerts.login_required')
    end
  end
end

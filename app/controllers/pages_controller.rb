# frozen_string_literal: true

class PagesController < ApplicationController
  def login; end

  def history
    if logged_in?
      @history_entries = current_user.history.reverse
    else
      redirect_to login_path, alert: t('alerts.login_required')
    end
  end

  def help; end
end

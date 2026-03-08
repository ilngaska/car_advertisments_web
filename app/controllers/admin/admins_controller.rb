# frozen_string_literal: true

module Admin
  class AdminsController < ApplicationController
    before_action :require_login
    before_action :ensure_admin!

    private

    def ensure_admin!
      redirect_to root_path, alert: t('alerts.access_denied') unless current_user&.admin?
    end
  end
end

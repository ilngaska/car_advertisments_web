# frozen_string_literal: true

module Admin
  class CarAdvertisementsController < ApplicationController
    before_action :require_login
    before_action :ensure_admin!
    before_action :set_car, only: %i[show edit update destroy]

    def index
      @cars = Car.order(created_at: :desc)
    end

    def show
      destroy
    end

    def new
      @car = Car.new
    end

    def edit; end

    def create
      @car = Car.new(car_params)
      if @car.save
        redirect_to admin_car_advertisements_path, notice: t('admin.messages.created')
      else
        render :new, status: :unprocessable_content
      end
    end

    def update
      if @car.update(car_params)
        redirect_to admin_car_advertisements_path, notice: t('admin.messages.updated')
      else
        render :edit, status: :unprocessable_content
      end
    end

    def destroy
      if @car
        @car.destroy
        redirect_to admin_car_advertisements_path, notice: t('admin.messages.deleted'), status: :see_other
      else
        redirect_to admin_car_advertisements_path, alert: t('alerts.not_found')
      end
    end

    private

    def set_car
      @car = Car.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_car_advertisements_path, alert: t('alerts.not_found')
    end

    def ensure_admin!
      redirect_to root_path, alert: t('alerts.access_denied') unless current_user&.admin?
    end

    def car_params
      params.expect(car: %i[make model year price description odometer date_added])
    end
  end
end

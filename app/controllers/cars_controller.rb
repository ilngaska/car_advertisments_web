# frozen_string_literal: true

class CarsController < ApplicationController
  include Pagy::Backend

  helper_method :car_params

  def index
    @cars_query = Car.filter_by_params(car_params).order_by_params(params[:sort])
    @pagy, @cars = pagy(@cars_query)

    return unless params[:car].present? && session[:user_email]

    UserManager.new.add_search_to_history(session[:user_email], car_params)
  end

  private

  def car_params
    params.expect(car: %i[make model year_from year_to price_from price_to])
  rescue ActionController::ParameterMissing
    ActionController::Parameters.new.permit!
  end
end

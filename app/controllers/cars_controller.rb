# frozen_string_literal: true

class CarsController < ApplicationController
  include Pagy::Backend

  helper_method :car_params

  def index
    @cars_query = Cars::Searcher.call(car_params)
    @cars_query = Cars::Sorter.call(@cars_query, params[:sort])
    @pagy, @cars = pagy(@cars_query)
  end

  private

  def car_params
    # Додаємо .permit!, щоб дозволити конвертацію в Hash у в'юшках
    params.expect(car: %i[make model year_from year_to price_from price_to]).permit!
  rescue ActionController::ParameterMissing
    ActionController::Parameters.new.permit!
  end
end

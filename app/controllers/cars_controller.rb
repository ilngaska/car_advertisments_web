# frozen_string_literal: true

class CarsController < ApplicationController
  include Pagy::Backend

  def index
    @car_params = car_params
    @cars_query = Cars::Searcher.call(car_params)
    @cars_query = Cars::Sorter.call(@cars_query, params[:sort])
    @pagy, @cars = pagy(@cars_query)
  end

  private

  def car_params
    params.fetch(:car, ActionController::Parameters.new)
          .permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end
end

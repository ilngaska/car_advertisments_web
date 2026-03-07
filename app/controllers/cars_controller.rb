class CarsController < ApplicationController
  include Pagy::Backend

  helper_method :car_params

  def index
    @cars_query = Car.filter_by_params(car_params).order_by_params(params[:sort])
    @pagy, @cars = pagy(@cars_query)
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  rescue ActionController::ParameterMissing
    ActionController::Parameters.new.permit!
  end
end

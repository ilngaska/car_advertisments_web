# frozen_string_literal: true

class CarsController < ApplicationController
  helper_method :car_params
  include Pagy::Backend

  def index
    all_cars = Car.all.map { |car| car.attributes.with_indifferent_access }
    prepared_cars = all_cars.map { |car| prepare_car_data(car) }
    filtered_results = apply_filters(prepared_cars, car_params)
    @sorted_cars = sort_results(filtered_results)
    @pagy, @cars = pagy_array(@sorted_cars)

    handle_user_history if logged_in?
  end

  private

  def handle_user_history
    UserManager.new.add_search_to_history(current_user.email, car_params)
    current_user.history
  end

  def car_params
    params.permit(:make, :model, :year_from, :year_to, :price_from, :price_to, :sort)
  end

  def prepare_car_data(car)
    c = car.dup
    date_val = c[:date_added] || c['date_added']
    c[:date_added] = begin
      date_val.is_a?(Date) ? date_val : Date.parse(date_val.to_s)
    rescue StandardError
      Date.new(1900, 1, 1)
    end
    c[:year] = c[:year].to_i
    c[:price] = c[:price].to_i
    c
  end

  def apply_filters(data, filters)
    data.select do |car|
      match_text?(car, filters) && match_year?(car, filters) && match_price?(car, filters)
    end
  end

  def match_text?(car, filters)
    make_ok = filters[:make].blank? || car[:make].to_s.casecmp?(filters[:make])
    model_ok = filters[:model].blank? || car[:model].to_s.casecmp?(filters[:model])
    make_ok && model_ok
  end

  def match_year?(car, filters)
    from = filters[:year_from].present? ? filters[:year_from].to_i : 0
    to = filters[:year_to].present? ? filters[:year_to].to_i : 9999
    car[:year].between?(from, to)
  end

  def match_price?(car, filters)
    from = filters[:price_from].present? ? filters[:price_from].to_i : 0
    to = filters[:price_to].present? ? filters[:price_to].to_i : Float::INFINITY
    car[:price].between?(from, to)
  end

  def sort_results(data)
    sort_val = params[:sort].presence || 'date_added_desc'
    parts = sort_val.split('_')
    direction = parts.pop
    column = parts.join('_')
    sorted = data.sort_by do |car|
      val = car[column]
      val.is_a?(Date) ? val.to_time.to_i : val.to_i
    end
    direction == 'desc' ? sorted.reverse : sorted
  end
end

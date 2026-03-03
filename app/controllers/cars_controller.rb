class CarsController < ApplicationController
  include Pagy::Backend

  def index
    # 1. Завантажуємо дані з бази та готуємо їх як у CarSearchEngine
    all_cars_raw = Car.all.map(&:attributes)
    prepared_cars = all_cars_raw.map { |car| prepare_car_data(car) }

    # 2. Збираємо фільтри з параметрів URL
    filters = {
      make: params[:make].presence,
      model: params[:model].presence,
      year_from: params[:year_from],
      year_to: params[:year_to],
      price_from: params[:price_from],
      price_to: params[:price_to]
    }

    # 3. Фільтрація (використовуємо твою логіку)
    results = apply_filters(prepared_cars, filters)

    # 4. Сортування
    sort_param = params[:sort] || 'date_added_desc'
    column, direction = sort_param.split('_', 2)
    column = 'date_added' if column == 'date'

    @sorted_cars = apply_sorting(results, column, direction)

    # 5. Пагінація масиву
    @pagy, @cars = pagy_array(@sorted_cars)
  end

  private

  # Твій оригінальний метод підготовки даних
  def prepare_car_data(car)
    car['date_added'] = Date.parse(car['date_added'].to_s) unless car['date_added'].is_a?(Date)
    %w[year price odometer].each { |key| car[key] = car[key].to_i }
    car
  end

  # Твій оригінальний метод сортування
  def apply_sorting(data, option, direction)
    sorted = data.sort_by { |car| car[option.to_s] || car['date_added'] }
    direction.to_s == 'desc' ? sorted.reverse : sorted
  end

  # Твій оригінальний метод фільтрації
  def apply_filters(data, filters)
    data.select do |car|
      match_make_model?(car, filters) && match_year?(car, filters) && match_price?(car, filters)
    end
  end

  def match_make_model?(car, filters)
    (filters[:make] ? car['make']&.casecmp?(filters[:make]) : true) &&
      (filters[:model] ? car['model']&.casecmp?(filters[:model]) : true)
  end

  def match_year?(car, filters)
    # Використовуємо твою логіку меж років
    year_from = filters[:year_from].present? ? [filters[:year_from].to_i, 1920].max : 1920
    year_to = filters[:year_to].present? ? [filters[:year_to].to_i, Time.now.year].min : Time.now.year
    car['year'].between?(year_from, year_to)
  end

  def match_price?(car, filters)
    price_from = filters[:price_from].to_i
    price_to = filters[:price_to].to_i
    (price_from.positive? ? car['price'] >= price_from : true) &&
      (price_to.positive? ? car['price'] <= price_to : true)
  end
end
# frozen_string_literal: true

module CarsHelper
  def symbol_for_sort(column)
    return '↕' unless params[:sort]&.start_with?(column.to_s)

    params[:sort].end_with?('asc') ? '↑' : '↓'
  end

  def format_car_price(price)
    number_to_currency(price, precision: 0, unit: '$')
  end

  def format_car_date(date)
    date&.strftime('%b %d, %Y')
  end
end

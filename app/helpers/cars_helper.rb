# frozen_string_literal: true

module CarsHelper
  def symbol_for_sort(column)
    return '↕' unless params[:sort]&.start_with?(column.to_s)

    params[:sort].end_with?('asc') ? '↑' : '↓'
  end
end

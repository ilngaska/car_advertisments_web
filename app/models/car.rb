# frozen_string_literal: true

class Car < ApplicationRecord
  scope :filter_by_params, lambda { |p|
    results = all
    results = results.where('make ILIKE ?', "%#{p[:make]}%") if p[:make].present?
    results = results.where('model ILIKE ?', "%#{p[:model]}%") if p[:model].present?

    # Виправляємо Range: перетворюємо параметри в цілі числа (.to_i)
    if p[:year_from].present? || p[:year_to].present?
      from = p[:year_from].presence.to_i
      to = p[:year_to].presence&.to_i || 9999
      results = results.where(year: from..to)
    end

    if p[:price_from].present? || p[:price_to].present?
      from = p[:price_from].presence.to_i
      to = p[:price_to].presence&.to_i || 1_000_000_000
      results = results.where(price: from..to)
    end
    results
  }

  scope :order_by_params, lambda { |sort_param|
    case sort_param
    when 'year_asc'  then order(year: :asc, id: :desc)
    when 'year_desc' then order(year: :desc, id: :desc)
    when 'price_asc'  then order(price: :asc, id: :desc)
    when 'price_desc' then order(price: :desc, id: :desc)
    when 'date_added_asc'  then order(date_added: :asc, id: :desc)
    else order(date_added: :desc, id: :desc)
    end
  }
end

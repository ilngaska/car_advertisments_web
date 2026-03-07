# frozen_string_literal: true

class Car < ApplicationRecord
  scope :filter_by_make, ->(make) { where('make ILIKE ?', "%#{make}%") }
  scope :filter_by_model, ->(model) { where(model: model) }
  scope :filter_by_year_from, ->(year) { where(year: year..) }
  scope :filter_by_year_to, ->(year) { where(year: ..year) }
  scope :filter_by_price_from, ->(price) { where(price: price..) }
  scope :filter_by_price_to, ->(price) { where(price: ..price) }

  scope :filter_sort_by, ->(order_logic) { order(order_logic) }
end

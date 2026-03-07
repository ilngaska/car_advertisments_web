# frozen_string_literal: true

# == Schema Information
#
# Table name: cars
#
#  id          :bigint           not null, primary key
#  date_added  :date
#  description :text
#  make        :string
#  model       :string
#  odometer    :integer
#  price       :integer
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  external_id :string
#
class Car < ApplicationRecord
  scope :filter_by_make, ->(make) { where('make ILIKE ?', "%#{make}%") }
  scope :filter_by_model, ->(model) { where(model: model) }
  scope :filter_by_year_from, ->(year) { where(year: year..) }
  scope :filter_by_year_to, ->(year) { where(year: ..year) }
  scope :filter_by_price_from, ->(price) { where(price: price..) }
  scope :filter_by_price_to, ->(price) { where(price: ..price) }

  scope :filter_sort_by, ->(order_logic) { order(order_logic) }
end

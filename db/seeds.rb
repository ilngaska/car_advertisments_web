# frozen_string_literal: true

require 'faker'

Car.destroy_all
50.times do
  Car.create!(
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year,
    price: rand(5000..50_000),
    created_at: Faker::Date.backward(days: 365)
  )
end

Rails.logger.debug { "Seed complete: Created #{Car.count} cars." }

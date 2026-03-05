# frozen_string_literal: true

require 'yaml'

Car.destroy_all
cars_data = YAML.load_file(Rails.root.join('db/data/cars.yml'))
cars_data.each do |car_attrs|
  ext_id = car_attrs.delete('id')
  Car.create!(car_attrs.merge(external_id: ext_id))
end

User.destroy_all

users_data = YAML.load_file(Rails.root.join('db/data/users.yml'))

users_data.each do |user_attrs|
  data = user_attrs.transform_keys(&:to_s)

  user = User.new(
    email: data['email'],
    password_digest: data['password'], # Беремо хеш з файлу
    role: data['role'] || 'user',
    history: data['history'] || []
  )

  # Зберігаємо без валідацій, щоб обійти перевірку пароля (has_secure_password)
  user.save!(validate: false)
end

Rails.logger.debug 'Юзери (з поштою та паролями) успішно завантажені! 🚀'

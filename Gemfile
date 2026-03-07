# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.4.7'

gem 'importmap-rails'
gem 'jbuilder'
gem 'propshaft'
gem 'puma', '>= 6.0'
gem 'rails', '~> 8.1.2'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'pg', '~> 1.5'

gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

gem 'bcrypt', '~> 3.1.7'

gem 'image_processing', '~> 1.2'
gem 'pagy', '~> 9.3'

gem 'bootsnap', require: false
gem 'kamal', require: false
gem 'thruster', require: false

group :development, :test do
  gem 'annotaterb'
  gem 'debug', platforms: %i[mri windows]
  gem 'faker'
end

group :development do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'rubocop-rails-omakase', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

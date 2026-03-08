# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.4.7'

gem 'bcrypt', '~> 3.1.17'
gem 'haml-rails'
gem 'pg', '~> 1.5'
gem 'puma', '>= 6.0'
gem 'rails', '~> 8.1.2'
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'importmap-rails'
gem 'jbuilder'
gem 'propshaft'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'

gem 'image_processing', '~> 1.2'
gem 'pagy', '~> 9.3'

gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

gem 'bootsnap', require: false
gem 'kamal', require: false
gem 'thruster', require: false

group :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'lefthook'
  gem 'rspec-rails', '~> 7.0'
  gem 'rubocop-rails-omakase', require: false
end

group :development do
  gem 'annotaterb'
  gem 'html2haml'
  gem 'web-console'
  gem 'yalphabetize'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'selenium-webdriver'
end

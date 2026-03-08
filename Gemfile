# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.4.7'

gem 'rails', '~> 8.1.2'
gem 'pg', '~> 1.5'
gem 'puma', '>= 6.0'
gem 'haml-rails' 
gem 'bcrypt', '~> 3.1.17' 
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'propshaft'
gem 'tailwindcss-rails'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'

gem 'image_processing', '~> 1.2' 
gem 'pagy', '~> 9.3' 

gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

gem 'bootsnap', require: false 
gem 'kamal', require: false
gem 'thruster', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'rspec-rails', '~> 7.0' 
  gem 'factory_bot_rails' 
  gem 'faker'
  gem 'brakeman', require: false 
  gem 'bundler-audit', require: false
  gem 'rubocop-rails-omakase', require: false
end

group :development do
  gem 'annotaterb'
  gem 'html2haml' 
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner-active_record' 
end


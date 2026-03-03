# config/initializers/pagy.rb
require 'pagy'
require 'pagy/extras/overflow'
require 'pagy/extras/array' 

# require 'pagy/extras/tailwindcss'

Pagy::DEFAULT[:items] = 10
Pagy::DEFAULT[:overflow] = :last_page
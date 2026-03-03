# config/initializers/pagy.rb
require "pagy"
require "pagy/extras/overflow"
require "pagy/extras/array"

Pagy::DEFAULT[:items] = 10
Pagy::DEFAULT[:overflow] = :last_page

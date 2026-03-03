require 'yaml'
Car.destroy_all

cars_data = YAML.load_file(Rails.root.join('db', 'data', 'cars.yml'))

cars_data.each do |car_attrs|
  ext_id = car_attrs.delete('id')
  Car.create!(car_attrs.merge(external_id: ext_id))
end

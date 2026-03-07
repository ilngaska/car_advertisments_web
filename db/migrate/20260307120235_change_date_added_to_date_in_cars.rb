class ChangeDateAddedToDateInCars < ActiveRecord::Migration[8.1]
  def change
    change_column :cars, :date_added, 'date USING date_added::date'
  end
end

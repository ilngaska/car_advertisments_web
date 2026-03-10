class CleanupCarsTable < ActiveRecord::Migration[8.1]
  def change
    remove_column :cars, :external_id, :string
    remove_column :cars, :date_added, :date
  end
end

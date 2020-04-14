class RemoveCityIdFromTrips < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :city_id, :integer
  end
end

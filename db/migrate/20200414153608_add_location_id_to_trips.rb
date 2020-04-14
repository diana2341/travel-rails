class AddLocationIdToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :location_id, :integer
  end
end

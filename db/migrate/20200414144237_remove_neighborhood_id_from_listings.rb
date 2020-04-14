class RemoveNeighborhoodIdFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :neighborhood_id, :integer
  end
end

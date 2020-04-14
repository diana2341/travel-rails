class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :rental_type
      t.integer :price
      t.integer :host_id
      t.integer :neighborhood_id
      t.string :amenities
      t.timestamps
    end
  end
end

class RemoveReservationIdFromReviews < ActiveRecord::Migration[6.0]
  def change

    remove_column :reviews, :reservation_id, :integer
  end
end

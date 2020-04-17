class Review < ApplicationRecord

    belongs_to :guest, :class_name => "User"
    #  belongs_to :reservation
    belongs_to :listing
    validates :rating, numericality: {greater_than: 0, less_than: 6}
end

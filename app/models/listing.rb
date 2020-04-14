class Listing < ApplicationRecord
    belongs_to :host, :class_name => "User"
    has_many :reservations
    has_many :reviews, through: :reservations
    has_many :guests, through: :reservations
    has_one_attached:image
end

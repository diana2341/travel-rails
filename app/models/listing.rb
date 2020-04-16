class Listing < ApplicationRecord
    belongs_to :host, :class_name => "User"
    belongs_to :location
    has_many :reservations
    has_many :reviews, through: :reservations
    has_many :guests, through: :reservations
    has_one_attached:image
    accepts_nested_attributes_for :location
    validates :title, presence:true
    validates :description, presence:true
    validates :rental_type, presence:true
    validates :price, presence:true
    validates :price, numericality: { only_integer: true }
    validates_numericality_of :price, :greater_than_or_equal_to => 1
    validates :address, presence:true
    validates :amenities, presence:true
    validates :image, presence:true

end

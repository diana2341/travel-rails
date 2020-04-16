class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    
    has_many :listings, :foreign_key => 'host_id'
    has_many :reservations, through: :listings
    has_many :reviews, :foreign_key => 'guest_id'
    has_many :trips, :foreign_key => 'guest_id', :class_name => "Reservation"
    validates :age, numericality: { only_integer: true }
    validates_numericality_of :age, :greater_than_or_equal_to => 21, message: "has to be 21 or older"
end
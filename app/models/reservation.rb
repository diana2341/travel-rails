class Reservation < ApplicationRecord

    belongs_to :listing
    belongs_to :guest, :class_name => "User"
    has_many :reviews

    validates :checkin, :checkout, presence: true
    validate :checkout_after_checkin

    private 

    def checkout_after_checkin
        return if checkout.blank? || checkin.blank?

        if checkout < checkin
            errors.add(:checkout, "must be after the checkin date")
        end
    end
end

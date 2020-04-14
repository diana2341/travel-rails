class AvailabilityValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
      reservations = Reservation.where(["guest_id =?", record.guest_id])
      date_ranges = Reservation.map { |b| b.checkin..b.checkout }
  
      date_ranges.each do |range|
        if range.include? value
          record.errors.add(attribute, "not available")
        end
      end
    end
  end
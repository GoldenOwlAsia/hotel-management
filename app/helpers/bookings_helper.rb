module BookingsHelper
  def get_rent_type_text(rent_type = :hourly)
    {
      hourly: 'Theo giờ',
      overnight: 'Qua đêm'
    }.with_indifferent_access.fetch(rent_type, nil)
  end

  def get_booking_guests(booking)
    return if booking.blank?

    booking.guests.pluck :guest_type
  end
end

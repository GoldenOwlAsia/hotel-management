class AvailableRoomsQuery
  def initialize(hotel_id)
    @hotel_id = hotel_id
  end

  def execute(start_date, end_date)
    bookings = Booking.period(start_date, end_date)
    booked_room_ids = bookings.pluck(:room_id)
    p 'bookings', bookings
    p 'all booking', Booking.all
    p 'booked_room_ids', booked_room_ids
    p 'rooms', Room.where(hotel_id: @hotel_id)
    Room.where(hotel_id: @hotel_id).where.not(id: booked_room_ids)
  end
end

class AvailableRoomsQuery
  def initialize(hotel_id)
    @hotel_id = hotel_id
  end

  def execute(start_date, end_date)
    bookings = Booking.period(start_date, end_date)
    booked_room_ids = bookings.pluck(:room_id)
    Room.where(hotel_id: @hotel_id).where.not(id: booked_room_ids)
  end
end

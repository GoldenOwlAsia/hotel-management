module RoomsHelper
  def get_rent_type_text(rent_type)
    if rent_type == 'hourly'
      'Theo giờ'
    elsif rent_type == 'overnight'
      'Qua đêm'
    else
      ''
    end
  end

  def get_rom_status_class(booking)
    "room-status-#{booking.status}"
  end

  def get_floor_number_text(group_key)
    if group_key == 0
      'Trệt'
    end
  end

  def format_date(date)
    date.strftime('%d.%m.%y')
  end

  def format_hour(date)
    date.strftime('%H:%M')
  end

  def booking_in_period(start_time, end_time)
    @cache ||= {}

    @cache.fetch("#{start_time}, #{end_time}") do |key|
      bookings = Booking.period(start_time, end_time)
      @cache[key] = bookings.inject(Hash.new { |h, k| h[k] = [] }) do |memo, booking|
        memo[booking.room_id] << booking
        memo
      end
    end
  end
end

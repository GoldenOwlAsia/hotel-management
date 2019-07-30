module BookingsHelper
  def get_rom_status_text(booking)
    if booking.status == 'booked'
      'Đã đặt phòng'
    elsif booking.status == 'rent'
      'Phòng đang thuê'
    else
      'Phòng trống'
    end
  end
end

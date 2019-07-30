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

  def get_rent_type_text(rent_type)
    if rent_type == 'hourly'
      'Theo giờ'
    elsif rent_type == 'overnight'
      'Qua đêm'
    end
  end
end

module RoomsHelper
  def get_rom_status_text(room)
    if room.status == 'booked'
      'Đã đặt phòng'
    elsif room.status == 'rent'
      'Phòng đang thuê'
    else
      'Phòng trống'
    end
  end

  def get_rom_status_class(room)
    "room-status-#{room.status}"
  end

  def get_rent_type_text(room)
    if room.rent_type == 'hourly'
      'Theo giờ'
    elsif room.rent_type == 'overnight'
      'Qua đêm'
    else
      ''
    end
  end

  def get_floor_number_text(group_key)
    if group_key == 0
      'Trệt'
    end
  end
end

module RoomsHelper
  def get_rom_status_class(booking)
    "room-status-#{booking.status}"
  end

  def get_floor_number_text(group_key)
    if group_key == 0
      'Trệt'
    end
  end

  def get_room_type_text(room_type)
    if room_type == 'double'
      'Phòng đôi'
    elsif room_type == 'single'
      'Phòng đơn'
    elsif room_type == 'queen'
      'Phòng queen'
    else
      ''
    end
  end

  def format_date(date)
    date.strftime('%d.%m.%y')
  end

  def format_hour(date)
    date.strftime('%H:%M')
  end

  def get_filter_text(room_status)
    if room_status == 'available'
      'Tất cả phòng trống'
    elsif room_status == 'all'
      'Tất cả phòng'
    else
      ''
    end
  end
end

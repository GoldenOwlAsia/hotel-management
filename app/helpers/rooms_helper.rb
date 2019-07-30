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
end

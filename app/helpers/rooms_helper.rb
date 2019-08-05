module RoomsHelper
  def get_rom_status_class(booking)
    "room-status-#{booking.status}"
  end

  def get_floor_number_text(group_key)
    if group_key == 0
      'Trệt'
    end
  end

  def get_room_type_text(room_type = :single)
    {
      single: 'Phòng đơn',
      double: 'Phòng đôi',
      queen: 'Phòng queen'
    }.with_indifferent_access.fetch(room_type, nil)
  end

  def format_date(date)
    date.strftime('%d.%m.%y')
  end

  def format_hour(date)
    date.strftime('%H:%M')
  end

  def get_filter_text(room_status = :all)
    {
      available: 'Tất cả phòng trống',
      all: 'Tất cả phòng'
  }.with_indifferent_access.fetch(room_status, nil)
  end
end

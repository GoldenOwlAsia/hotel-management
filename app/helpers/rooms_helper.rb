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
end

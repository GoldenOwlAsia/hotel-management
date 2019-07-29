class RoomsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:hotel_id])
    service = AvailableRoomsQuery.new(params[:hotel_id])
    @checkin_time = params[:checkin_time] || Time.current.change(hour: 12)
    @checkout_time = params[:checkout_time] || 1.day.from_now.change(hour: 12)
    available_rooms = service.execute(@checkin_time, @checkout_time)
    @available_rooms_groups = available_rooms.group(:room_type).count

    @rooms = room_status == 'available' ? available_rooms : Room.where(hotel_id: params[:hotel_id])
    @rooms = @rooms.where(room_type: room_type_param) if room_type_param

    @single_rooms = @rooms.single
    @double_rooms = @rooms.double
    @queen_rooms = @rooms.queen

    @grouped_rooms = @rooms.group_by(&:floor_number)
    @sorted_groups = @grouped_rooms.keys.sort

    @room_filter = RoomFilter.new(
      checkin_time: @checkin_time,
      checkout_time: @checkout_time,
      room_status: room_status
    )
  end

  private

  def room_status
    @room_status ||= params[:room_status]
  end

  def room_type_param
    @room_type_param ||= params[:room_type]
  end
end

class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update]
  def index
    @hotel = Hotel.find(params[:hotel_id])

    @checkin_time = params[:checkin_time] || Time.current.change(hour: 12)
    @checkout_time = params[:checkout_time] || 1.day.from_now.change(hour: 12)

    @available_rooms_groups = available_rooms.group(:room_type).count
    @available_rooms_groups.default = 0

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

    @booking_in_period = booking_in_period(@checkin_time, @checkout_time)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path(hotel_id: Hotel.find(params[:hotel_id]).id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path(hotel_id: Hotel.find(params[:hotel_id]).id)
    else
      render 'edit'
    end
  end

  private

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

  def available_rooms
    @available_rooms ||= begin
      service = AvailableRoomsQuery.new(params[:hotel_id])
      service.execute(@checkin_time, @checkout_time)
    end
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:hotel_rooms).permit(:room_number, :room_type, :floor_number, :hotel_id)
  end

  def room_status
    @room_status ||= params[:room_status]
  end

  def room_type_param
    @room_type_param ||= params[:room_type]
  end
end

class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update]
  def index
    # room params: checkin_time, checkout_time, room_status, room_type
    @hotel = Hotel.find(params[:hotel_id])

    @checkin_time = params[:checkin_time] || Time.current.change(hour: 12)
    @checkout_time = params[:checkout_time] || 1.day.from_now.change(hour: 12)

    # example: {"queen"=>10, "double"=>10, "single"=>10}
    @available_rooms_groups = available_rooms.group(:room_type).count
    @available_rooms_groups.default = 0

    # array of room active records
    @rooms = room_status == 'available' ? available_rooms : all_rooms
    # filter result if param room_type present?
    @rooms = @rooms.where(room_type: room_type) if room_type
    @single_rooms = @rooms.single
    @double_rooms = @rooms.double
    @queen_rooms = @rooms.queen
    # example: { 0=>[ #room 1, #room 2 ], 1=>[ #room 3, #room 4 ] }
    @grouped_rooms = @rooms.group_by(&:floor_number)
    # example: [ 0, 1 ]
    @sorted_groups = @grouped_rooms.keys.sort

    @room_filter = RoomFilter.new(
      checkin_time: @checkin_time,
      checkout_time: @checkout_time,
      room_status: room_status
    )

    # group bookings by room id
    # example: { 1 =>[ #booking 1, #bookng 2],
    #            2=>[ #bokking 3, #booking 4]
    #          }
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

  def all_rooms
    @all_rooms ||= Room.where(hotel_id: params[:hotel_id])
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:hotel_rooms).permit(:room_number, :room_type, :floor_number, :hotel_id, :price)
  end

  def room_status
    @room_status ||= params[:room_status]
  end

  def room_type
    @room_type ||= params[:room_type]
  end
end

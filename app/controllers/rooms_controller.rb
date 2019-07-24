class RoomsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @hotel_id = @hotel.id
    @hotel_name = @hotel.name
    @rooms = Room.where(hotel_id: params[:hotel_id])
    @rooms = @rooms.where(room_type: room_type_param) if room_type_param
    @single_rooms = @rooms.single
    @double_rooms = @rooms.double
    @queen_rooms = @rooms.queen

    @available_rooms = Room.where(hotel_id: params[:hotel_id], status: 'available')
                          .group(:room_type)
                          .count

    @available_rooms_filter = @rooms.where(room_status: room_status_param) if room_status_param

    @grouped_rooms = @rooms.group_by(&:floor_number)
    @sorted_groups = @grouped_rooms.keys.sort
  end

  def booking
    @customer = Customer.find_by(customer_nin: booking_params[:customer_nin])

    if @customer.blank?
      @customer = Customer.create(
        customer_nin: booking_params[:customer_nin],
        name: booking_params[:name]
      )
    end

    @booking = Booking.new(
      customer: @customer,
      checkin_time: booking_params[:checkin_time],
      checkout_time: booking_params[:checkout_time],
      booked_at: booking_params[:booked_at],
      status: booking_params[:status]
    )

    if @booking.save
      redirect_to rooms_path
    else
      render 'booking'
    end
  end

  private

  def room_type_param
    @room_type_param ||= params[:room_type]
  end

  def room_status_param
    @room_status_param ||= params[:room_status]
  end
end

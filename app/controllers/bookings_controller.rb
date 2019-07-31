class BookingsController < ApplicationController
  before_action :set_room_and_booking, only: [:edit, :update]

  def new
    @room = Room.find(params[:room_id])
    @checkin_time = params[:checkin_time]
    @checkout_time = params[:checkout_time]
    @booking = Booking.new(checkin_time: @checkin_time, checkout_time: @checkout_time)
  end

  def create
    @customer = Customer.find_by(customer_nin: booking_params[:customer_nin])
    if @customer.blank?
      @customer = Customer.create(
        customer_nin: booking_params[:customer_nin],
        name: booking_params[:name],
        phone_number: booking_params[:phone_number]
      )
    end

    @booking = Booking.new(
      customer: @customer,
      checkin_time: booking_params[:checkin_time],
      checkout_time: booking_params[:checkout_time],
      rent_type: booking_params[:rent_type],
      room_id: params[:room_id],
      status: 'checked_in'
    )

    if @booking.save!
      redirect_to rooms_path(hotel_id: Room.find(params[:room_id]).hotel.id)
    else
      render 'new'
    end
  end

  private

  def set_room_and_booking
    @room = Room.find(params[:room_id])
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:room_bookings).permit(:checkin_time, :checkout_time, :booked_at, :room_id, :customer_id, :status, :name, :phone_number, :customer_nin, :rent_type)
  end
end

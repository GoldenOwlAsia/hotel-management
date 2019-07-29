class BookingsController < ApplicationController
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
      booked_at: booking_params[:booked_at],
      status: booking_params[:status],
      rent_type: booking_params[:rent_type],
      booking_phone_number: booking_params[:booking_phone_number],
      room_id: params[:room_id],
      status: 'checked_in'
    )
    if @booking.save!
      redirect_to rooms_path(hotel_id: Room.find(params[:room_id]).hotel.id)
    else
      render 'new'
    end
  end

  def edit
    @room = Room.find(params[:room_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params_edit)
      redirect_to rooms_path(hotel_id: Room.find(params[:room_id]).hotel.id)
    else
      render 'edit'
    end
  end

  private

  def booking_params
    params.require(:room_bookings).permit(:checkin_time, :checkout_time, :booked_at, :room_id, :booking_phone_number, :customer_id, :status, :name, :phone_number, :customer_nin, :rent_type)
  end

  def booking_params_edit
    params.require(:bookings).permit(:checkin_time, :checkout_time, :booked_at, :room_id, :booking_phone_number, :customer_id, :status, :name, :phone_number, :customer_nin, :rent_type)
  end
end
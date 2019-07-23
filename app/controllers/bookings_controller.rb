class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin_time, :checkout_time, :booked_at, :room_id, :customer_id, :phone_number, :status, :name, :phone_number, :customer_nin, :rent_type)
  end
end

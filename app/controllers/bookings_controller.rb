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
      @booking.guests.create(guest_type: 'women', quantity: women_count) if women_count > 0
      @booking.guests.create(guest_type: 'men', quantity: men_count) if men_count > 0
      @booking.guests.create(guest_type: 'baby_girl', quantity: baby_girl_count) if baby_girl_count > 0
      @booking.guests.create(guest_type: 'baby_boy', quantity: baby_boy_count) if baby_boy_count > 0

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

  def women_count
    @women_count ||= booking_params[:women].to_i
  end

  def men_count
    @men_count ||= booking_params[:men].to_i
  end

  def baby_girl_count
    @baby_girl_count ||= booking_params[:baby_girl].to_i
  end

  def baby_boy_count
    @baby_boy_count ||= booking_params[:baby_boy].to_i
  end

  def booking_params
    params.require(:room_bookings).permit(
      :checkin_time,
      :checkout_time,
      :booked_at,
      :room_id,
      :customer_id,
      :status,
      :name,
      :phone_number,
      :customer_nin,
      :rent_type,
      :women,
      :men,
      :baby_girl,
      :baby_boy
    )
  end
end

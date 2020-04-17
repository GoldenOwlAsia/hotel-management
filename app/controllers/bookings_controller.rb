class BookingsController < ApplicationController
  before_action :set_room_and_booking, only: %i[show edit update check_in]

  def new
    @room = Room.find(params[:room_id])
    @room_booking = RoomBooking.new(
      room_id: params[:room_id],
      checkin_time: params[:checkin_time].to_datetime,
      checkin_date: params[:checkin_time].to_datetime
    )
  end

  def create
    @room = Room.find(params[:room_id])
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
      checkin_time: checkin_datetime,
      rent_type: booking_params[:rent_type],
      room_id: params[:room_id],
      status: params['commit'] ? 'checked_in' : 'unchecked_in',
      price: @room.price
    )
    if @booking.save

      @booking.guests.create(guest_type: 'women', quantity: women_count) if women_count.positive?

      @booking.guests.create(guest_type: 'men', quantity: men_count) if men_count.positive?

      @booking.guests.create(guest_type: 'baby_girl', quantity: baby_girl_count) if baby_girl_count.positive?

      @booking.guests.create(guest_type: 'baby_boy', quantity: baby_boy_count) if baby_boy_count.positive?

      redirect_to rooms_path(hotel_id: Room.find(params[:room_id]).hotel.id)
    else
      flash[:danger] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end

  def show
    @room_booking = set_room_booking_form_object(@room, @booking)
    # additional variable if the booking is checked in
    if @booking.checked_in?
      @checkout_time = Time.now
      @total_guests = [@room_booking.men, @room_booking.women, @room_booking.baby_boy, @room_booking.baby_girl].sum
    end
  end

  def edit
    @room_booking = set_room_booking_form_object(@room, @booking)
    update if params['save_edit'].present?
  end

  def update
    room_booking = set_room_booking_form_object(@room, @booking)
    @customer = @booking.customer
    @customer.update(name: booking_params[:name], customer_nin: booking_params[:customer_nin], phone_number: booking_params[:phone_number])

    men_changed = (room_booking.men != men_count)
    women_changed = (room_booking.women != women_count)
    baby_boy_changed = (room_booking.baby_boy != baby_boy_count)
    baby_girl_changed = (room_booking.baby_girl != baby_girl_count)

    @booking.guests.men.first_or_initialize.update(quantity: men_count) if men_changed
    @booking.guests.women.first_or_initialize.update(quantity: women_count) if women_changed
    @booking.guests.baby_girl.first_or_initialize.update(quantity: baby_girl_count) if baby_girl_changed
    @booking.guests.baby_boy.first_or_initialize.update(quantity: baby_boy_count) if baby_boy_changed

    redirect_to rooms_path(hotel_id: Room.find(params[:room_id]).hotel.id)
  end

  def check_in
    return if @booking.checked_in?

    room_booking = set_room_booking_form_object(@room, @booking)
    if params['cancel_booking']
      destroy
    elsif params['commit']
      @booking.status = 'checked_in'

      men_changed = (room_booking.men != men_count)
      women_changed = (room_booking.women != women_count)
      baby_boy_changed = (room_booking.baby_boy != baby_boy_count)
      baby_girl_changed = (room_booking.baby_girl != baby_girl_count)

      if @booking.save
        @booking.guests.men.first_or_initialize.update(quantity: men_count) if men_changed
        @booking.guests.women.first_or_initialize.update(quantity: women_count) if women_changed
        @booking.guests.baby_girl.first_or_initialize.update(quantity: baby_girl_count) if baby_girl_changed
        @booking.guests.baby_boy.first_or_initialize.update(quantity: baby_boy_count) if baby_boy_changed

        redirect_to rooms_path(hotel_id: @booking.room.hotel.id)
      else
        flash[:danger] = "Check in fail!"
        render :show
      end
    end
  end

  def check_out
    @booking = Booking.find(params[:id])
    @rental_time = (((Time.current + 7.hours).to_f - @booking.checkin_time.to_f)/1.hour).round(1).abs()
    @room_money = @rental_time * @booking.price.to_i
    @services = @booking.service_uses
    @total_service_money = 0
    @total_pay_money = 0
    session[:total_pay] = 0
    respond_to do |format|
      format.js
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    hotel_id = booking.room.hotel.id
    booking.destroy
    redirect_to rooms_path(hotel_id: hotel_id)
  end

  private

  def set_room_booking_form_object(room_record, booking_record)
    RoomBooking.new(
      room_id: room_record.id,
      checkin_time: booking_record.checkin_time,
      checkin_date: booking_record.checkin_time.to_date,
      rent_type: booking_record.rent_type,
      name: booking_record.customer.name,
      customer_nin: booking_record.customer.customer_nin,
      phone_number: booking_record.customer.phone_number,
      men: booking_record.guests.where(guest_type: 'men').first&.quantity || 0,
      women: booking_record.guests.where(guest_type: 'women').first&.quantity || 0,
      baby_girl: booking_record.guests.where(guest_type: 'baby_girl').first&.quantity || 0,
      baby_boy: booking_record.guests.where(guest_type: 'baby_boy').first&.quantity || 0,
      services: Service.all.map { |s| [s.name, (booking_record.service_uses.where(service_id: s.id).first&.quantity || 0), s.price, s.id, booking_record.service_uses.ids]}
    )
  end

  def set_room_and_booking
    @room = Room.find(params[:room_id])
    @booking = Booking.find(params[:id])
  end

  def women_count
    @women_count = booking_params[:women].to_i
  end

  def men_count
    @men_count = booking_params[:men].to_i
  end

  def baby_girl_count
    @baby_girl_count = booking_params[:baby_girl].to_i
  end

  def baby_boy_count
    @baby_boy_count = booking_params[:baby_boy].to_i
  end

  def checkin_datetime
    @checkin_datetime = (booking_params[:checkin_date].to_datetime + Time.parse(booking_params[:checkin_time]).seconds_since_midnight.seconds).to_datetime
  end

  def booking_params
    params.require(:room_booking).permit(
      :checkin_date,
      :checkin_time,
      :status,
      :name,
      :phone_number,
      :customer_nin,
      :rent_type,
      :women,
      :men,
      :baby_girl,
      :baby_boy,
      :services
    )
  end
end

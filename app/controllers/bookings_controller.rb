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
      checkout_time: 1.month.from_now,
      rent_type: booking_params[:rent_type],
      room_id: params[:room_id],
      status: params['commit'] ? 'checked_in' : 'unchecked_in',
      price: @room.price
    )
    if @booking.save!
      if women_count.positive?
        @booking.guests.create(guest_type: 'women', quantity: women_count)
      end
      if men_count.positive?
        @booking.guests.create(guest_type: 'men', quantity: men_count)
      end
      if baby_girl_count.positive?
        @booking.guests.create(guest_type: 'baby_girl', quantity: baby_girl_count)
      end
      if baby_boy_count.positive?
        @booking.guests.create(guest_type: 'baby_boy', quantity: baby_boy_count)
      end
      redirect_to rooms_path(hotel_id: Room.find(params[:room_id]).hotel.id)
    else
      flash[:danger] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end

  def show
    @room_booking = RoomBooking.new(
      booking_id: @booking.id,
      room_id: @room.id,
      checkin_time: @booking.checkin_time,
      checkin_date: @booking.checkin_time.to_date,
      rent_type: @booking.rent_type,
      name: @booking.customer.name,
      customer_nin: @booking.customer.customer_nin,
      phone_number: @booking.customer.phone_number,
      men: @booking.guests.where(guest_type: 'men').first&.quantity || 0,
      women: @booking.guests.where(guest_type: 'women').first&.quantity || 0,
      baby_girl: @booking.guests.where(guest_type: 'baby_girl').first&.quantity || 0,
      baby_boy: @booking.guests.where(guest_type: 'baby_boy').first&.quantity || 0,
      services: Service.all.map { |s| [s.name, (@booking.service_uses.where(service_id: s.id).first&.quantity || 0), s.price]}
    )
    # puts @room_booking.inspect
    puts @room_booking.inspect
  end

  def edit
    @room_booking = RoomBooking.new(
      booking_id: @booking.id,
      room_id: @room.id,
      checkin_time: @booking.checkin_time,
      checkin_date: @booking.checkin_time.to_date,
      rent_type: @booking.rent_type,
      name: @booking.customer.name,
      customer_nin: @booking.customer.customer_nin,
      phone_number: @booking.customer.phone_number,
      men: @booking.guests.where(guest_type: 'men').first&.quantity || 0,
      women: @booking.guests.where(guest_type: 'women').first&.quantity || 0,
      baby_girl: @booking.guests.where(guest_type: 'baby_girl').first&.quantity || 0,
      baby_boy: @booking.guests.where(guest_type: 'baby_boy').first&.quantity || 0,
    )
  end

  def update
    # @customer = Customer.find_by(customer_nin: booking_params[:customer_nin])
    @customer = @booking.customer
    @customer.update!(name: booking_params[:name], customer_nin: booking_params[:customer_nin], phone_number: booking_params[:phone_number])

    @booking.guests.men.first_or_initialize.update(quantity: men_count)
    @booking.guests.women.first_or_initialize.update(quantity: women_count)
    @booking.guests.baby_girl.first_or_initialize.update(quantity: baby_girl_count)
    @booking.guests.baby_boy.first_or_initialize.update(quantity: baby_boy_count)

    redirect_to rooms_path(hotel_id: Room.find(params[:room_id]).hotel.id)
  end

  def check_in
    return if @booking.checked_in?

    @room_booking = RoomBooking.new(
      booking_id: @booking.id,
      room_id: @room.id,
      checkin_time: @booking.checkin_time,
      checkin_date: @booking.checkin_time.to_date,
      rent_type: @booking.rent_type,
      name: @booking.customer.name,
      customer_nin: @booking.customer.customer_nin,
      phone_number: @booking.customer.phone_number,
      men: @booking.guests.where(guest_type: 'men').first&.quantity || 0,
      women: @booking.guests.where(guest_type: 'women').first&.quantity || 0,
      baby_girl: @booking.guests.where(guest_type: 'baby_girl').first&.quantity || 0,
      baby_boy: @booking.guests.where(guest_type: 'baby_boy').first&.quantity || 0,
      # format: [[service_name, quantity, price]]
      services: Service.all.map { |s| [s.name, @booking.service_uses.where(service_id: s.id).first&.quantity || 0, s.price]}
    )

    if params['cancel_booking']
      destroy
    elsif params['commit']

      if @booking.update!(status: 'checked_in')
        # only update if user change guest quantity
        if @room_booking.men != men_count
          @booking.guests.men.first_or_initialize.update(quantity: men_count)
        end
        # only update if user change guest quantity
        if @room_booking.women != women_count
          @booking.guests.women.first_or_initialize.update(quantity: women_count)
        end
        # only update if user change guest quantity
        if @room_booking.baby_girl != baby_girl_count
          @booking.guests.baby_girl.first_or_initialize.update(quantity: baby_girl_count)
        end
        # only update if user change guest quantity
        if @room_booking.baby_boy != baby_boy_count
          @booking.guests.baby_boy.first_or_initialize.update(quantity: baby_boy_count)
        end

        # update service uses
        @room_booking.services.each do |s|
          service_name = s[0]
          old_quantity = s[1].to_i
          new_quantity = params[s[0]].to_i

          # only update if any servie input value changes
          if old_quantity != new_quantity
            service_record = Service.find_by_name(service_name)
            @booking.service_uses.create!(service_id: service_record.id, quantity: new_quantity)
          end
        end

        redirect_to rooms_path(hotel_id: Room.find(params[:room_id]).hotel.id)

      else
        flash[:danger] = "Check in fail!"
        render :show
      end
    end
  end

  def destroy
    booking= Booking.find(params[:id])
    room_id =  booking.room_id
    booking.destroy
    redirect_to rooms_path(hotel_id: Room.find(room_id).hotel.id)
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

  def checkin_datetime
    @checkin_datetime ||= (booking_params[:checkin_date].to_datetime + Time.parse(booking_params[:checkin_time]).seconds_since_midnight.seconds).to_datetime
  end

  def booking_params
    params.require(:room_booking).permit(
      :checkin_date,
      :checkin_time,
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
      :baby_boy,
      :services
    )
  end
end

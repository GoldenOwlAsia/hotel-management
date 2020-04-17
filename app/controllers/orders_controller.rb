class OrdersController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @order = Order.new(booking_id: @booking.id, customer_id: @booking.customer.id, total: session[:total_pay].to_i, order_date: Time.current + 7.hours, paid: session[:total_pay].to_i, payment_method: 'cash')
    if @order.save
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = 'Order was not created.'
      redirect_to rooms_path(hotel_id: Room.find(params[:room_id]).hotel.id)
    end
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    Booking.find_by(id: params[:booking_id]).destroy
    Customer.find_by(id: @booking.customer_id)
    redirect_to root_path
  end
end

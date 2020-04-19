class OrdersController < ApplicationController
  before_action :prepare_booking

  def create
    @order = @booking.build_order(customer_id: @booking.customer.id, total: session[:total_pay].to_i, order_date: Time.current + 7.hours, paid: session[:total_pay].to_i, payment_method: 'cash')
    if @order.save
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = 'Order was not created.'
      redirect_to root_path
    end
  end

  def destroy
    Booking.find_by(id: params[:booking_id]).destroy
    Customer.find_by(id: @booking.customer_id)
    flash[:danger] = 'Successfully destroyed'
    redirect_to root_path
  end

  private

  def prepare_booking
    @booking = Booking.find(params[:booking_id])
  end
end

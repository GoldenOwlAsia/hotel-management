class ServiceUsesController < ApplicationController
  def update_service_use
    @booking = Booking.find(params[:booking_id])
    @service = Service.find(params[:service_id])
    @service_use = ServiceUse.find_or_initialize_by(service_id: params[:service_id], booking_id: params[:booking_id])
    @service_use.update_attributes(service_id: params[:service_id], booking_id: params[:booking_id], quantity: params[:amount])
    @service_use.save
  end
end

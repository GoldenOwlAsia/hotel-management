class ServiceUsesController < ApplicationController
  before_action :prepare_service_use

  def update
    @service_use = ServiceUse.find_or_initialize_by(service_id: params[:service_id], booking_id: params[:booking_id])
    @service_use.update(service_id: params[:service_id], booking_id: params[:booking_id], quantity: params[:amount])
  end

  private

  def prepare_service_use
    @booking = Booking.find(params[:booking_id])
    @service = Service.find(params[:service_id])
  end
end

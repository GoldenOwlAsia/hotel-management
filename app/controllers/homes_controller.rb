class HomesController < ApplicationController
  def index
    first_hotel = current_user.hotels.first
    if first_hotel.present?
      redirect_to rooms_path(hotel_id: first_hotel.id)
    else
      @hotels = current_user.hotels
    end
  end
end

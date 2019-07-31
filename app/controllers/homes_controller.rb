class HomesController < ApplicationController
  def index
    first_hotel = current_user.hotels.first
    if first_hotel.present?
      redirect_to hotel_rooms_path(first_hotel)
    else
      @hotels = current_user.hotels
    end
  end
end

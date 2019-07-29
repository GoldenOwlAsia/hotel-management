class HomesController < ApplicationController
  def index
    if current_user.hotels.first.present?
      redirect_to rooms_path(hotel_id: current_user.hotels.first.id)
    else
      @hotels = current_user.hotels
    end
  end
end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
  protect_from_forgery

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || begin
      hotels = current_user.hotels
      hotels.present? ? hotel_rooms_path(hotels.first) : root_path
    end
  end
end

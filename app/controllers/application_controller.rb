class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_raven_context

  include Pundit
  protect_from_forgery

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || begin
      hotels = current_user.hotels
      hotels.present? ? hotel_rooms_path(hotels.first) : root_path
    end
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end

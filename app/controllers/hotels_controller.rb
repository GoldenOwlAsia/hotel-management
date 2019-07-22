class HotelsController < ApplicationController
  def index
    @hotels = current_user.hotels
  end
end

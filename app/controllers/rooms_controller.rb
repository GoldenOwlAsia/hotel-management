class RoomsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @hotel_id = @hotel.id
    @hotel_name = @hotel.name

    @rooms = Room.where(hotel_id: params[:hotel_id])
    @rooms = @rooms.where(room_type: room_type_param) if room_type_param
    @rooms = @rooms.where('room_number ILIKE ?', "%#{search_param}%") if search_param
    @standard_rooms = @rooms.standard
    @superior_rooms = @rooms.superior
    @vip_rooms = @rooms.vip

    @available_rooms = Room.where(hotel_id: params[:hotel_id], status: 'available')
                           .group(:room_type)
                           .count
  end

  def show
    @room = Room.find(params[:id])
  end

  private

  def search_param
    @search_param ||= begin
      params[:search] && params[:search][:q]
    end
  end

  def room_type_param
    @room_type_param ||= params[:room_type]
  end
end

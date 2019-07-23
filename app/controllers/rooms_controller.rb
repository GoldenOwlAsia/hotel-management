class RoomsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @hotel_id = @hotel.id
    @hotel_name = @hotel.name
    @rooms = Room.where(hotel_id: params[:hotel_id])
    @rooms = @rooms.where(room_type: room_type_param) if room_type_param
    @rooms = @rooms.where('room_number ILIKE ?', "%#{search_param}%") if search_param
    @single_rooms = @rooms.single
    @double_rooms = @rooms.double
    @queen_rooms = @rooms.queen

    @available_rooms = Room.where(hotel_id: params[:hotel_id], status: 'available')
                          .group(:room_type)
                          .count
                          
    @rooms_floor_one = Room.where(hotel_id: params[:hotel_id], floor_number: 1)
    @rooms_floor_two = Room.where(hotel_id: params[:hotel_id], floor_number: 2)
    @rooms_floor_three = Room.where(hotel_id: params[:hotel_id], floor_number: 3)
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

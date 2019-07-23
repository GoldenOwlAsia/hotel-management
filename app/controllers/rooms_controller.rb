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

    @grouped_rooms = Room.where(hotel_id: params[:hotel_id]).group_by(&:floor_number)
    @sorted_groups = @grouped_rooms.keys.sort
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

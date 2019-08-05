class HotelsController < ApplicationController
  before_action :set_hotel, only: [:edit, :update, :destroy]

  def index
    @hotels = current_user.hotels
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to hotels_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @hotel.update(hotel_params)
      redirect_to hotels_path
    else
      render 'edit'
    end
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :address)
  end
end

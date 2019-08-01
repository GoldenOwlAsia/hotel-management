class RoomBooking
  attr_accessor :name, :customer_nin, :phone_number, :rent_type, :room_id
  attr_accessor :checkin_date, :checkin_time, :men, :women, :baby_girl, :baby_boy

  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def initialize(params)
    @name = params.fetch(:name, '')
    @customer_nin = params.fetch(:customer_nin, '')
    @phone_number = params.fetch(:phone_number, '')
    @rent_type = params.fetch(:rent_type, 'hourly')
    @checkin_date = params.fetch(:checkin_date, Time.current)
    @checkin_time = params.fetch(:checkin_time, Time.current)
    @men = params.fetch(:men, 0)
    @women = params.fetch(:women, 0)
    @baby_girl = params.fetch(:baby_girl, 0)
    @baby_boy = params.fetch(:baby_boy, 0)
  end
end

class RoomBooking
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :customer_nin, :phone_number, :rent_type, :room_id, :checkin_date, :checkin_time, :men, :women, :baby_girl, :baby_boy, :services

  validates :name, :customer_nin, :checkin_date, :checkin_time, presence: true
  validates :name, length: { maximum: 30 }
  validates :phone_number, length: { maximum: 10 }

  def initialize(params)
    @room_id = params.fetch(:room_id)
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
    # format: [[service_name, quantity, price]]
    @services = params.fetch(:services, [])
  end
end

class RemoveBookingPhoneNumberFromBookings < ActiveRecord::Migration[6.0]
  def change

    remove_column :bookings, :booking_phone_number, :string
  end
end

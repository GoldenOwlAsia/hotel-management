class RenamePhoneNumberToBookingPhoneNumberInBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :phone_number, :booking_phone_number
  end
end

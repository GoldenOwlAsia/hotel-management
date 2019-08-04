class AddOrderIdToBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :order, null: true, foreign_key: true
  end
end

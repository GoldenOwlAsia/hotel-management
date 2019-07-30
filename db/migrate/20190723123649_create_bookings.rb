class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :room, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.datetime :checkin_time
      t.datetime :checkout_time
      t.datetime :booked_at
      t.string :phone_number
      t.string :status

      t.timestamps
    end
  end
end

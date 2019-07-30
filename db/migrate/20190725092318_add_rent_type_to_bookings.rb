class AddRentTypeToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :rent_type, :string
  end
end

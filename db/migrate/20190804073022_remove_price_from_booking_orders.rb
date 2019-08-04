class RemovePriceFromBookingOrders < ActiveRecord::Migration[6.0]
  def change

    remove_column :booking_orders, :price, :decimal
  end
end

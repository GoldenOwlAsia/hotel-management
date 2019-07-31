class CreateBookingOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_orders do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end

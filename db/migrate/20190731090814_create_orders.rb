class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.datetime :order_date
      t.decimal :total
      t.decimal :paid
      t.string :payment_method

      t.timestamps
    end
  end
end

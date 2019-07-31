class CreateServiceOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :service_orders do |t|
      t.references :service, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end

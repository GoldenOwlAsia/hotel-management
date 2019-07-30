class AddIndexToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_index :customers, :customer_nin
  end
end

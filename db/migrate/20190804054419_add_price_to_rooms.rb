class AddPriceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :price, :decimal
  end
end

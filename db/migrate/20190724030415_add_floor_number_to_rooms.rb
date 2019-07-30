class AddFloorNumberToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :floor_number, :integer
  end
end

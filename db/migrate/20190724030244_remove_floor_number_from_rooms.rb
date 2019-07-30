class RemoveFloorNumberFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :floor_number, :string
  end
end

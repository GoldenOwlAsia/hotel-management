class ChangeFloorNumberToBeStringInRooms < ActiveRecord::Migration[6.0]
  def up
    change_column :rooms, :floor_number, :string
  end

  def down
    change_column :rooms, :floor_number, :integer
  end
end

class RemoveRenTypeFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :rent_type, :string
  end
end

class RemoveStatusFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :status, :string
  end
end

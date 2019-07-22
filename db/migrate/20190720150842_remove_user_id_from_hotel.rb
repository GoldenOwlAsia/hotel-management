class RemoveUserIdFromHotel < ActiveRecord::Migration[6.0]
  def change
    remove_column :hotels, :user_id, :integer
  end
end

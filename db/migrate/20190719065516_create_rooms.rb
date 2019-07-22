class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.string :status
      t.string :rent_type
      t.string :floor_number
      t.string :room_type
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end

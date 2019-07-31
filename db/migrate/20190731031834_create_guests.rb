class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.references :room, null: false, foreign_key: true
      t.integer :women
      t.integer :men
      t.integer :baby_girl
      t.integer :baby_boy

      t.timestamps
    end
  end
end

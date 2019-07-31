class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :guest_type
      t.integer :quantity
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end

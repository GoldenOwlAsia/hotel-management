class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.decimal :price
      t.string :image

      t.timestamps
    end
  end
end

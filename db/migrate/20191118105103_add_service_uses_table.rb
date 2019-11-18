class AddServiceUsesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :service_uses do |t|
      t.references :service, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.timestamps
    end

  end
end

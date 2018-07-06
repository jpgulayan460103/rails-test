class CreateReceivingDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :receiving_details do |t|
      t.references :receiving, foreign_key: true
      t.references :item, foreign_key: true
      t.decimal :cost_price, precision: 15, scale: 2
      t.integer :quantity
      t.datetime :deleted_at
      
      t.timestamps
    end
    add_index :receiving_details, :deleted_at
  end
end

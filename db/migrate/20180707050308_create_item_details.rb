class CreateItemDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :item_details do |t|
      t.integer :quantity
      t.decimal :cost_price, precision: 15, scale: 2
      t.references :item, foreign_key: {on_delete: :cascade}
      # t.references :sale, foreign_key: true
      t.references :receiving, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :item_details, :deleted_at
  end
end

class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :subcategory
      t.references :category, foreign_key: {on_delete: :set_null}
      t.string :code
      t.string :unit_of_measure
      t.integer :reorder_level
      t.decimal :retail_price, precision: 15, scale: 2
      t.decimal :dealers_price, precision: 15, scale: 2
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :items, :deleted_at
  end
end

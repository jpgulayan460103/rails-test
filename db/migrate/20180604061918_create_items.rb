class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :subcategory
      t.string :code
      t.string :unit_of_measure
      t.decimal :retail_price, precision: 15, scale: 2
      t.decimal :dealers_price, precision: 15, scale: 2
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :items, :deleted_at
  end
end

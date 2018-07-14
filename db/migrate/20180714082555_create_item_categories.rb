class CreateItemCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :item_categories do |t|
      t.string :category
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :item_categories, :deleted_at
  end
end

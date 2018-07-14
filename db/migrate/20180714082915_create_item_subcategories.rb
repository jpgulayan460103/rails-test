class CreateItemSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :item_subcategories do |t|
      t.references :category, foreign_key: {on_delete: :cascade}
      t.string :subcategory
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

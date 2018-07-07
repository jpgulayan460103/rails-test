class CreatePurchaseOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_orders do |t|
      t.string :number
      t.references :user, foreign_key: true
      t.datetime :deleted_at
      
      t.timestamps
    end
    add_index :purchase_orders, :deleted_at
  end
end

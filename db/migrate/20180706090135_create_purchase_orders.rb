class CreatePurchaseOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_orders do |t|
      t.string :number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

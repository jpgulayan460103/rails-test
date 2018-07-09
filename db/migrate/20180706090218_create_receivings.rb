class CreateReceivings < ActiveRecord::Migration[5.1]
  def change
    create_table :receivings do |t|
      t.references :purchase_order, foreign_key: true
      t.references :user, foreign_key: true
      t.text :comment
      t.datetime :deleted_at
      t.text :deleted_comment
      # t.references :deleted_by, index: true, foreign_key: {to_table: :users}
      
      t.timestamps
    end
    add_index :receivings, :deleted_at
  end
end

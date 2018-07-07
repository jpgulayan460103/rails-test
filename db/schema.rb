# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180706090847) do

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "category"
    t.string "subcategory"
    t.string "code"
    t.string "unit_of_measure"
    t.decimal "retail_price", precision: 15, scale: 2
    t.decimal "dealers_price", precision: 15, scale: 2
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_items_on_deleted_at"
  end

  create_table "purchase_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchase_orders_on_user_id"
  end

  create_table "receiving_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "receiving_id"
    t.bigint "item_id"
    t.decimal "cost_price", precision: 15, scale: 2
    t.integer "quantity"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_receiving_details_on_deleted_at"
    t.index ["item_id"], name: "index_receiving_details_on_item_id"
    t.index ["receiving_id"], name: "index_receiving_details_on_receiving_id"
  end

  create_table "receivings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "purchase_order_id"
    t.bigint "user_id"
    t.text "comment"
    t.datetime "deleted_at"
    t.text "deleted_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_receivings_on_deleted_at"
    t.index ["purchase_order_id"], name: "index_receivings_on_purchase_order_id"
    t.index ["user_id"], name: "index_receivings_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "purchase_orders", "users"
  add_foreign_key "receiving_details", "items"
  add_foreign_key "receiving_details", "receivings"
  add_foreign_key "receivings", "purchase_orders"
  add_foreign_key "receivings", "users"
end

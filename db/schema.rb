
ActiveRecord::Schema[7.0].define(version: 2024_03_02_175850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.bigint "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
    t.index ["name"], name: "index_accounts_on_name"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_banks_on_name"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount", null: false
    t.datetime "date", null: false
    t.text "description"
    t.text "duplicate_ids", array: true
    t.bigint "account_id"
    t.bigint "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["bank_id"], name: "index_transactions_on_bank_id"
    t.index ["duplicate_ids"], name: "index_transactions_on_duplicate_ids"
  end

  add_foreign_key "accounts", "banks"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "banks"
end

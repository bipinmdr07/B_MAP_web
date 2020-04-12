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

ActiveRecord::Schema.define(version: 2017_03_14_081124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "post", default: ""
    t.decimal "salary", precision: 8, scale: 2, default: "0.0"
    t.datetime "joining_date"
    t.string "working_plan"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "addition_holiday", precision: 8, scale: 2, default: "0.0"
    t.decimal "addition_overtime", precision: 8, scale: 2, default: "0.0"
    t.decimal "addition_miscellaneous", precision: 8, scale: 2, default: "0.0"
    t.decimal "deduction_loan", precision: 8, scale: 2, default: "0.0"
    t.decimal "deduction_late", precision: 8, scale: 2, default: "0.0"
    t.decimal "deduction_miscellaneous", precision: 8, scale: 2, default: "0.0"
    t.decimal "company_deduction_absent", precision: 8, scale: 2, default: "0.0"
    t.decimal "company_deduction_wtax", precision: 8, scale: 2, default: "10.0"
    t.decimal "net_total_addition", precision: 8, scale: 2, default: "0.0"
    t.decimal "net_total_deduction", precision: 8, scale: 2, default: "0.0"
    t.decimal "net_pay", precision: 8, scale: 2
    t.boolean "new_created", default: true
    t.boolean "updated", default: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "capitals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "phone_no"
    t.string "address"
    t.decimal "total_amount", precision: 8, scale: 2
    t.string "capital_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "new_created", default: true
    t.boolean "updated", default: false
    t.index ["user_id"], name: "index_capitals_on_user_id"
  end

  create_table "recycle_bins", force: :cascade do |t|
    t.string "table_name"
    t.integer "corr_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.date "date", default: "2020-04-12"
    t.decimal "amount", precision: 8, scale: 2, default: "0.0"
    t.string "cash_type"
    t.bigint "capital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "new_created", default: true
    t.boolean "updated", default: false
    t.index ["capital_id"], name: "index_transactions_on_capital_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_token"
    t.boolean "is_admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: true
    t.datetime "activated_at"
    t.string "address"
    t.string "bank_name"
    t.string "account_number"
    t.string "nationality"
    t.string "mobile"
    t.string "home"
    t.string "work"
    t.string "image"
    t.string "auth_token"
    t.boolean "updated", default: false
    t.boolean "new_created", default: true
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "capitals", "users"
  add_foreign_key "transactions", "capitals"
end

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

ActiveRecord::Schema.define(version: 20161022201635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "journals", force: :cascade do |t|
    t.string   "title"
    t.text     "entry"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["position_id"], name: "index_journals_on_position_id", using: :btree
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "cash",       precision: 12, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fund_name"
    t.index ["user_id"], name: "index_portfolios_on_user_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "portfolio_id"
    t.integer  "stock_id"
    t.decimal  "open_price",   precision: 12, scale: 2
    t.decimal  "close_price",  precision: 12, scale: 2
    t.integer  "quantity"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["portfolio_id"], name: "index_positions_on_portfolio_id", using: :btree
    t.index ["stock_id"], name: "index_positions_on_stock_id", using: :btree
  end

  create_table "stocks", force: :cascade do |t|
    t.decimal  "current_price", precision: 12, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "ticker"
    t.string   "company_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end

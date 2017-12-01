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

ActiveRecord::Schema.define(version: 20171201074012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "portion"
    t.integer "price"
    t.text "category_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.float "vat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "postal_code"
    t.integer "city"
    t.string "email"
    t.string "phone"
    t.datetime "last_visit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "price"
    t.bigint "category_id"
    t.text "article_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_menus_on_category_id"
  end

  create_table "note_entries", force: :cascade do |t|
    t.bigint "note_id", null: false
    t.bigint "article_id"
    t.bigint "menu_id"
    t.text "notice", default: [], array: true
    t.integer "value"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_note_entries_on_article_id"
    t.index ["menu_id"], name: "index_note_entries_on_menu_id"
    t.index ["note_id"], name: "index_note_entries_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "value"
    t.string "currency"
    t.string "reference"
    t.integer "table_number"
    t.integer "seats"
    t.text "menu_ids", default: [], array: true
    t.text "article_ids", default: [], array: true
    t.text "notice_ids", default: [], array: true
    t.string "state"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string "image"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.integer "table_number"
    t.integer "table_capacity"
    t.integer "floor_number"
    t.boolean "occupied"
    t.boolean "terrace"
    t.boolean "smoker"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "value"
    t.string "currency"
    t.bigint "note_id"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_tickets_on_note_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

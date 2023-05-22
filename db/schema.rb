# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_22_053013) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "practice_id", null: false
    t.bigint "institution_id", null: false
    t.text "originalcontent"
    t.text "translatedcontent"
    t.date "appointmentdate"
    t.text "cardkeywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_cards_on_institution_id"
    t.index ["practice_id"], name: "index_cards_on_practice_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.text "info"
    t.integer "rating"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutionspractices", force: :cascade do |t|
    t.bigint "institution_id", null: false
    t.bigint "practice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_institutionspractices_on_institution_id"
    t.index ["practice_id"], name: "index_institutionspractices_on_practice_id"
  end

  create_table "medicalkeywords", force: :cascade do |t|
    t.string "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practicekeywords", force: :cascade do |t|
    t.bigint "practice_id", null: false
    t.bigint "medicalkeyword_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicalkeyword_id"], name: "index_practicekeywords_on_medicalkeyword_id"
    t.index ["practice_id"], name: "index_practicekeywords_on_practice_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "institutions"
  add_foreign_key "cards", "practices"
  add_foreign_key "cards", "users"
  add_foreign_key "institutionspractices", "institutions"
  add_foreign_key "institutionspractices", "practices"
  add_foreign_key "practicekeywords", "medicalkeywords"
  add_foreign_key "practicekeywords", "practices"
end

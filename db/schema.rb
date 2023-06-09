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

ActiveRecord::Schema[7.0].define(version: 2023_05_31_082003) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "practice_id", null: false
    t.bigint "institution_id"
    t.text "originalcontent"
    t.text "translatedcontent"
    t.date "appointmentdate"
    t.text "cardkeywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cardphrases"
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
    t.float "latitude"
    t.float "longitude"
    t.string "photo_url"
    t.string "google_places_id"
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

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
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
    t.string "japanese_name"
  end

  create_table "studyphrases", force: :cascade do |t|
    t.string "kanji"
    t.string "english"
    t.string "kana"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_studyphrases_on_user_id"
  end

  create_table "studywords", force: :cascade do |t|
    t.string "english"
    t.string "kanji"
    t.string "romaji"
    t.string "kana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_studywords_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cards", "institutions"
  add_foreign_key "cards", "practices"
  add_foreign_key "cards", "users"
  add_foreign_key "institutionspractices", "institutions"
  add_foreign_key "institutionspractices", "practices"
  add_foreign_key "practicekeywords", "medicalkeywords"
  add_foreign_key "practicekeywords", "practices"
  add_foreign_key "studyphrases", "users"
  add_foreign_key "studywords", "users"
end

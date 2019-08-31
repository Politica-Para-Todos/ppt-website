# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_31_150326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "manifesto_items", force: :cascade do |t|
    t.bigint "manifesto_section_id", null: false
    t.string "kind"
    t.integer "position"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manifesto_section_id"], name: "index_manifesto_items_on_manifesto_section_id"
  end

  create_table "manifesto_sections", force: :cascade do |t|
    t.bigint "manifesto_id", null: false
    t.bigint "manifesto_section_id"
    t.string "kind"
    t.integer "position"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manifesto_id"], name: "index_manifesto_sections_on_manifesto_id"
    t.index ["manifesto_section_id"], name: "index_manifesto_sections_on_manifesto_section_id"
  end

  create_table "manifestos", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "manifesto_items", "manifesto_sections"
  add_foreign_key "manifesto_sections", "manifesto_sections"
  add_foreign_key "manifesto_sections", "manifestos"
end

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

ActiveRecord::Schema.define(version: 2020_05_08_121544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cours", force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.string "img"
    t.text "description"
    t.text "category"
    t.text "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "aditional_files"
  end

  create_table "cours_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cour_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cour_id"], name: "index_cours_users_on_cour_id"
    t.index ["user_id"], name: "index_cours_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "lucas.dubernard@hotmail.fr", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.string "status"
    t.string "level"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cours_users", "cours"
  add_foreign_key "cours_users", "users"
end

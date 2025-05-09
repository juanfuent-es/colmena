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

ActiveRecord::Schema[7.2].define(version: 2025_05_09_053451) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "programs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "number", default: 0, null: false
    t.text "description"
    t.integer "year", default: 2025, null: false
    t.string "school", default: ""
    t.string "url", default: ""
  end

  create_table "quotations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "client", default: "", null: false
    t.string "logo", default: "", null: false
    t.string "project", default: ""
    t.string "description", default: ""
    t.string "title", default: ""
    t.string "slug", default: ""
    t.string "footer", default: ""
    t.integer "weeks", default: 0
    t.integer "total", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "program_id", null: false
    t.string "title", default: "", null: false
    t.integer "number", default: 0, null: false
    t.text "description"
    t.text "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_themes_on_program_id"
  end

  create_table "topics", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "theme_id", null: false
    t.integer "number", default: 0, null: false
    t.string "title", default: "", null: false
    t.integer "estimated_time", default: 0
    t.string "content_type", default: ""
    t.text "objective"
    t.text "exercises"
    t.text "homework"
    t.text "comments"
    t.text "reference_material"
    t.text "credits_and_sources"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme_id"], name: "index_topics_on_theme_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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

  add_foreign_key "themes", "programs"
  add_foreign_key "topics", "themes"
end

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

  create_table "blocks", force: :cascade do |t|
    t.integer "position", default: 0, null: false
    t.uuid "page_id", null: false
    t.string "block_type", default: "", null: false, comment: "text | image | video | code"
    t.string "language", default: "", comment: "For code blocks: ruby | python | javascript | etc."
    t.uuid "image_id"
    t.string "title", default: "", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_blocks_on_image_id"
    t.index ["page_id"], name: "index_blocks_on_page_id"
  end

  create_table "images", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "file", default: "", null: false
    t.integer "width", default: 0, null: false
    t.integer "height", default: 0, null: false
    t.string "aspect_ratio", default: "1/1", null: false
    t.string "orientation", default: "landscape", null: false, comment: "landscape|portrait"
    t.boolean "processed", default: false
    t.string "status", default: "empty", null: false, comment: "empty|processing|ready"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "slug", default: "", null: false
    t.string "title", default: "", null: false
    t.string "synopsis", default: "", null: false
    t.string "cover", default: "", comment: "La misma imagen se ocupará de metadata"
    t.string "category", default: "", null: false, comment: "Static | Blog | Article | Tutorial | Course | Workshop"
    t.string "keywords", default: ""
    t.text "content"
    t.boolean "published", default: false, comment: "draft or published"
    t.boolean "restricted", default: false, comment: "For static pages. e.g. Home, About, Contact, ..."
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.integer "number", default: 0, null: false
    t.string "title", default: "", null: false
    t.text "objective"
    t.text "description"
    t.integer "year", default: 2026, null: false
    t.uuid "user_id", null: false
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "quotations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "client", default: "", null: false
    t.string "project", default: ""
    t.string "title", default: "", null: false
    t.string "subject", default: ""
    t.string "detail", default: "", null: false
    t.integer "weeks", default: 0
    t.integer "total_number", default: 0
    t.string "total_string", default: ""
    t.string "currency", default: "MXN"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.string "title", default: "", null: false
    t.integer "number", default: 0, null: false
    t.text "description"
    t.text "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_themes_on_program_id"
  end

  create_table "topics", force: :cascade do |t|
    t.bigint "theme_id", null: false
    t.integer "number", default: 0, null: false
    t.string "title", default: "", null: false
    t.integer "estimated_time", default: 0
    t.string "content_type", default: ""
    t.text "presentation"
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
    t.string "role", default: "visitor", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "www", default: ""
    t.string "name", default: ""
    t.string "avatar", default: ""
    t.text "bio"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 3, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "location", default: "", null: false
    t.string "ip", default: "", null: false
    t.index ["ip"], name: "index_visitors_on_ip"
  end

  create_table "visits", force: :cascade do |t|
    t.string "visitable_type"
    t.bigint "visitable_id"
    t.bigint "visitor_id", null: false
    t.integer "counter", default: 0, null: false
    t.index ["visitable_type", "visitable_id"], name: "index_visits_on_visitable"
    t.index ["visitor_id"], name: "index_visits_on_visitor_id"
  end

  add_foreign_key "blocks", "images"
  add_foreign_key "blocks", "pages"
  add_foreign_key "pages", "users"
  add_foreign_key "programs", "users"
  add_foreign_key "themes", "programs"
  add_foreign_key "topics", "themes"
  add_foreign_key "visits", "visitors"
end

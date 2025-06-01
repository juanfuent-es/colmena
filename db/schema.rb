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
    t.integer "number", default: 0, null: false
    t.string "block_type", default: "", null: false
    t.string "blockable_type", null: false
    t.bigint "blockable_id", null: false
    t.bigint "image_id"
    t.string "title", default: "", null: false
    t.string "description", default: ""
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blockable_type", "blockable_id"], name: "index_blocks_on_blockable"
    t.index ["image_id"], name: "index_blocks_on_image_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "file", default: "", null: false
    t.integer "width", default: 0, null: false
    t.integer "height", default: 0, null: false
    t.string "orientation", default: "landscape", null: false, comment: "landscape|portrait"
    t.boolean "processed", default: false
    t.string "status", default: "empty", null: false, comment: "empty|processing|ready"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.integer "total_views", default: 0, null: false
    t.integer "number", default: 0, null: false
    t.string "lang", default: "es", null: false
    t.string "slug", default: "", null: false
    t.string "category", default: "", null: false, comment: "Static | Blog | Article | Tutorial | Course | Workshop"
    t.string "title", default: "", null: false
    t.text "content"
    t.string "og_title", default: "", null: false
    t.string "og_description", default: "", null: false
    t.string "og_image", default: ""
    t.string "keywords", default: ""
    t.boolean "published", default: true, comment: "For static pages. e.g. Home, About, Contact, ..."
    t.boolean "restricted", default: false, comment: "For static pages. e.g. Home, About, Contact, ..."
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "number", default: 0, null: false
    t.integer "total_views", default: 0, null: false
    t.text "description"
    t.integer "year", default: 2025, null: false
    t.string "school", default: ""
    t.string "url", default: ""
  end

  create_table "quotations", force: :cascade do |t|
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

  create_table "users", force: :cascade do |t|
    t.string "role", default: "visitor", null: false
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
  add_foreign_key "pages", "users"
  add_foreign_key "themes", "programs"
  add_foreign_key "topics", "themes"
  add_foreign_key "visits", "visitors"
end

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

ActiveRecord::Schema.define(version: 2023_04_15_211025) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_comments_on_spot_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.integer "overall"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_likes_on_spot_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "spot_tag_relations", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_spot_tag_relations_on_spot_id"
    t.index ["tag_id"], name: "index_spot_tag_relations_on_tag_id"
  end

  create_table "spot_tags", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_spot_tags_on_spot_id"
    t.index ["tag_id"], name: "index_spot_tags_on_tag_id"
  end

  create_table "spots", force: :cascade do |t|
    t.text "body"
    t.integer "overall"
    t.integer "level"
    t.integer "q"
    t.integer "w"
    t.integer "e"
    t.integer "r"
    t.integer "t"
    t.integer "y"
    t.integer "u"
    t.integer "i"
    t.integer "o"
    t.integer "p"
    t.integer "a"
    t.integer "s"
    t.integer "d"
    t.integer "f"
    t.integer "g"
    t.integer "h"
    t.integer "j"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "user_id"
    t.string "place"
    t.string "title"
    t.string "link"
    t.string "about"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.string "Mana"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
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
    t.string "name"
    t.text "profile"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "spots"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "spots"
  add_foreign_key "likes", "users"
  add_foreign_key "spot_tag_relations", "spots"
  add_foreign_key "spot_tag_relations", "tags"
  add_foreign_key "spot_tags", "spots"
  add_foreign_key "spot_tags", "tags"
end

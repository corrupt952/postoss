# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150418170644) do

  create_table "postoss_categories", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "slug",                             null: false
    t.integer  "use_layout", limit: 1, default: 1, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "postoss_categories", ["name"], name: "index_postoss_categories_on_name", unique: true
  add_index "postoss_categories", ["slug"], name: "index_postoss_categories_on_slug", unique: true

  create_table "postoss_images", force: :cascade do |t|
    t.string   "unique_id",  limit: 16, null: false
    t.string   "file",                  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "postoss_images", ["unique_id"], name: "index_postoss_images_on_unique_id", unique: true

  create_table "postoss_posts", force: :cascade do |t|
    t.string   "unique_id",   limit: 16, null: false
    t.integer  "category_id",            null: false
    t.string   "title",                  null: false
    t.text     "body",                   null: false
    t.string   "thumbnail"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "postoss_posts", ["unique_id"], name: "index_postoss_posts_on_unique_id", unique: true

end

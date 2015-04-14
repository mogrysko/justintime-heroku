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

ActiveRecord::Schema.define(version: 20150414130700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "coursename"
    t.string   "coursetitle"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["term_id"], name: "index_taggings_on_term_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "tagname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "termlists", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "termlists", ["course_id"], name: "index_termlists_on_course_id", using: :btree
  add_index "termlists", ["term_id"], name: "index_termlists_on_term_id", using: :btree

  create_table "terms", force: :cascade do |t|
    t.string   "termname"
    t.string   "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "terms", ["termname"], name: "index_terms_on_termname", using: :btree

end

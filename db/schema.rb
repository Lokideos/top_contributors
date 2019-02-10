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

ActiveRecord::Schema.define(version: 2019_02_10_094245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributors", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "contributors_search_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributors_search_id"], name: "index_contributors_on_contributors_search_id"
  end

  create_table "contributors_searches", force: :cascade do |t|
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diplomas", force: :cascade do |t|
    t.string "contributor_name", null: false
    t.bigint "contributor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributor_id"], name: "index_diplomas_on_contributor_id"
  end

  add_foreign_key "contributors", "contributors_searches"
  add_foreign_key "diplomas", "contributors"
end

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

ActiveRecord::Schema.define(version: 20170307090924) do

  create_table "map_mtypeships", force: :cascade do |t|
    t.integer  "map_id"
    t.integer  "mtype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string   "name"
    t.string   "monstertype"
    t.integer  "atk"
    t.integer  "def"
    t.integer  "hp"
    t.integer  "exp"
    t.integer  "lvl"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "mtype_id"
    t.integer  "map_id"
    t.integer  "maxhp"
    t.integer  "speed",       default: 2
    t.index ["map_id"], name: "index_monsters_on_map_id"
    t.index ["mtype_id"], name: "index_monsters_on_mtype_id"
  end

  create_table "mtypes", force: :cascade do |t|
    t.string   "name"
    t.string   "monstertype"
    t.integer  "atk"
    t.integer  "def"
    t.integer  "hp"
    t.integer  "exp"
    t.integer  "lvl"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "speed",       default: 1
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "atk"
    t.integer  "def"
    t.integer  "hp"
    t.integer  "ap"
    t.integer  "exp"
    t.integer  "lvl"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "maxhp"
    t.integer  "speed",      default: 2
  end

end

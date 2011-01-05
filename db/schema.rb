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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 7) do

  create_table "books", :force => true do |t|
    t.string   "isbn"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "heros", :force => true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "names", :force => true do |t|
    t.string   "value"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nicks", :force => true do |t|
    t.string   "value"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portraits", :force => true do |t|
    t.string   "url"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "key"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "feed"
    t.string   "lang"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

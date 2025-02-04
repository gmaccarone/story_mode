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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110712165421) do

  create_table "characters", :force => true do |t|
    t.string   "story_id"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["story_id"], :name => "index_characters_on_story_id"
  add_index "characters", ["user_id", "story_id"], :name => "index_characters_on_user_id_and_story_id", :unique => true
  add_index "characters", ["user_id"], :name => "index_characters_on_user_id"

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phrases", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phrases", ["story_id"], :name => "index_phrases_on_story_id"

  create_table "stories", :force => true do |t|
    t.integer  "user_id"
    t.string   "blurb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "character_count", :default => 5
    t.integer  "turn"
  end

  add_index "stories", ["title"], :name => "index_stories_on_title"
  add_index "stories", ["user_id"], :name => "index_stories_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end

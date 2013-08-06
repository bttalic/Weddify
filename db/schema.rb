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

ActiveRecord::Schema.define(:version => 20130805145828) do

  create_table "galleries", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.integer  "provider_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "galleries", ["provider_id"], :name => "index_galleries_on_provider_id", :unique => true
  add_index "galleries", ["user_id"], :name => "index_galleries_on_user_id", :unique => true

  create_table "items", :force => true do |t|
    t.integer  "wishlist_id"
    t.string   "name"
    t.string   "link"
    t.integer  "priority"
    t.integer  "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  add_index "items", ["wishlist_id", "id"], :name => "index_items_on_wishlist_id_and_id", :unique => true

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "gallery_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "category"
    t.string   "email"
    t.string   "remember_token"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "providers", ["email"], :name => "index_providers_on_email", :unique => true
  add_index "providers", ["name"], :name => "index_providers_on_name", :unique => true
  add_index "providers", ["remember_token"], :name => "index_providers_on_remember_token"

  create_table "stories", :force => true do |t|
    t.integer  "user_id"
    t.text     "story_text"
    t.integer  "provider_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "stories", ["provider_id"], :name => "index_stories_on_provider_id", :unique => true
  add_index "stories", ["user_id"], :name => "index_stories_on_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name_groom"
    t.string   "name_bride"
    t.string   "last_name"
    t.string   "email_groom"
    t.string   "email_bride"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email_bride"], :name => "index_users_on_email_bride", :unique => true
  add_index "users", ["email_groom"], :name => "index_users_on_email_groom", :unique => true
  add_index "users", ["name_bride"], :name => "index_users_on_name_bride", :unique => true
  add_index "users", ["name_groom"], :name => "index_users_on_name_groom", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "wishlists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "wishlists", ["item_id"], :name => "index_wishlists_on_item_id", :unique => true
  add_index "wishlists", ["user_id"], :name => "index_wishlists_on_user_id", :unique => true

end

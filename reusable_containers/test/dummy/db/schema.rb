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

ActiveRecord::Schema.define(:version => 20111017154157) do

  create_table "containers", :force => true do |t|
    t.string   "name"
    t.string   "layout",     :default => "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_group_elements", :force => true do |t|
    t.integer  "content_group_id"
    t.integer  "element_id"
    t.string   "element_type"
    t.integer  "position",         :default => 0
    t.string   "layout",           :default => "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_group_elements", ["content_group_id"], :name => "index_content_group_elements_on_content_group_id"
  add_index "content_group_elements", ["element_id", "element_type"], :name => "index_content_group_elements_on_element"

  create_table "content_groups", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "text"
    t.string   "keywords"
    t.string   "description"
    t.integer  "container_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "ancestry_depth",          :default => 0
    t.string   "ancestry_slug"
    t.string   "slug"
    t.string   "destination_string"
    t.integer  "destination_object_id"
    t.string   "destination_object_type"
    t.boolean  "published",               :default => false
  end

  add_index "entries", ["ancestry"], :name => "index_entries_on_ancestry"
  add_index "entries", ["container_id"], :name => "index_entries_on_container_id"
  add_index "entries", ["destination_object_type", "destination_object_id"], :name => "index_entries_on_destination_object"
  add_index "entries", ["slug", "ancestry_slug"], :name => "index_entries_on_slug_and_ancestry_slug", :unique => true

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "baseline"
    t.datetime "scheduled_at"
    t.text     "description"
    t.integer  "host_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["host_id"], :name => "index_events_on_host_id"

  create_table "free_contents", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "css_classes"
    t.string   "css_id"
    t.text     "content"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hosts", :force => true do |t|
    t.string   "name"
    t.string   "short_description"
    t.text     "description"
    t.string   "gmap"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "title"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "alias"
    t.string   "email"
    t.string   "phone_number"
    t.string   "website"
    t.string   "twitter_username"
    t.string   "other"
    t.string   "as"
    t.text     "about"
    t.text     "expectations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organisation"
  end

end

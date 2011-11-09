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

ActiveRecord::Schema.define(:version => 20111109155155) do

  create_table "members", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "membername"
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "profiles", :force => true do |t|
    t.integer  "member_id"
    t.text     "bio",            :limit => 500
    t.string   "website"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "url"
    t.string   "url_anchor"
    t.string   "website_anchor"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "summary",        :limit => 255
    t.string   "client"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tags"
    t.integer  "member_id"
    t.text     "description"
    t.string   "pointofcontact"
    t.datetime "startdate"
    t.datetime "finishdate"
    t.string   "url"
    t.string   "uri"
    t.string   "requiredskills"
    t.string   "uri_anchor"
  end

  add_index "projects", ["member_id"], :name => "index_projects_on_member_id"

end

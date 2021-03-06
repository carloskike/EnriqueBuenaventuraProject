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

ActiveRecord::Schema.define(version: 20151108083205) do

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "name",        limit: 255
    t.datetime "date"
    t.string   "decription",  limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "attachment",  limit: 255
    t.boolean  "stata",       limit: 1,   default: false
    t.boolean  "statepublic", limit: 1,   default: false
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "books", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "cronologies", force: :cascade do |t|
    t.string   "event",      limit: 255
    t.datetime "date"
    t.string   "descripton", limit: 255
    t.string   "url",        limit: 255
    t.integer  "type_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cronologies", ["type_id"], name: "index_cronologies_on_type_id", using: :btree

  create_table "documentauthors", force: :cascade do |t|
    t.integer  "document_id", limit: 4
    t.integer  "author_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "documentbooks", force: :cascade do |t|
    t.integer  "document_id", limit: 4
    t.integer  "book_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.datetime "date"
    t.string   "autor",         limit: 255
    t.string   "attachment",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "subtopic_id",   limit: 4
    t.integer  "prose_id",      limit: 4
    t.integer  "speciality_id", limit: 4
    t.string   "place",         limit: 255
    t.string   "status",        limit: 255
    t.integer  "number",        limit: 4
  end

  add_index "documents", ["prose_id"], name: "index_documents_on_prose_id", using: :btree
  add_index "documents", ["speciality_id"], name: "index_documents_on_speciality_id", using: :btree
  add_index "documents", ["subtopic_id"], name: "index_documents_on_subtopic_id", using: :btree

  create_table "glosaries", force: :cascade do |t|
    t.string   "word",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "cronology_id", limit: 4
    t.string   "image",        limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "proses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "specialities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subtopics", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "credential",             limit: 255
    t.string   "subject",                limit: 255
    t.string   "semester",               limit: 255
    t.string   "interest",               limit: 255
    t.string   "level",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "articles", "users"
  add_foreign_key "cronologies", "types"
  add_foreign_key "documents", "proses"
  add_foreign_key "documents", "specialities"
  add_foreign_key "documents", "subtopics"
end

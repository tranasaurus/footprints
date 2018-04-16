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

ActiveRecord::Schema.define(version: 20180403210924) do

  create_table "annual_starting_craftsman_salaries", force: :cascade do |t|
    t.string "location", limit: 255, null: false
    t.float  "amount",   limit: 24,  null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.date     "applied_on"
    t.string   "email",                    limit: 255
    t.date     "initial_reply_on"
    t.date     "completed_challenge_on"
    t.date     "reviewed_on"
    t.date     "begin_refactoring_on"
    t.date     "resubmitted_challenge_on"
    t.date     "decision_made_on"
    t.string   "hired",                    limit: 255,   default: "no_decision"
    t.string   "codeschool",               limit: 255
    t.string   "college_degree",           limit: 255
    t.string   "cs_degree",                limit: 255
    t.string   "worked_as_dev",            limit: 255
    t.string   "assigned_craftsman",       limit: 255
    t.string   "code_submission",          limit: 255
    t.text     "additional_notes",         limit: 65535
    t.integer  "craftsman_id",             limit: 4
    t.text     "about",                    limit: 65535
    t.text     "software_interest",        limit: 65535
    t.text     "reason",                   limit: 65535
    t.text     "url",                      limit: 65535
    t.string   "slug",                     limit: 255
    t.boolean  "has_steward",              limit: 1
    t.string   "skill",                    limit: 255
    t.string   "discipline",               limit: 255
    t.string   "location",                 limit: 255
    t.boolean  "archived",                 limit: 1,     default: false
    t.date     "start_date"
    t.date     "end_date"
    t.string   "mentor",                   limit: 255
    t.date     "sent_challenge_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "offered_on"
  end

  add_index "applicants", ["craftsman_id"], name: "index_applicants_on_craftsman_id", using: :btree
  add_index "applicants", ["name"], name: "index_applicants_on_name", using: :btree
  add_index "applicants", ["slug"], name: "index_applicants_on_slug", unique: true, using: :btree

  create_table "assigned_craftsman_records", force: :cascade do |t|
    t.integer  "applicant_id", limit: 4
    t.integer  "craftsman_id", limit: 4
    t.boolean  "current",      limit: 1, default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "craftsmen", force: :cascade do |t|
    t.string  "name",              limit: 255
    t.string  "status",            limit: 255
    t.integer "employment_id",     limit: 4
    t.string  "uid",               limit: 255
    t.string  "email",             limit: 255
    t.string  "location",          limit: 255, default: "Chicago"
    t.boolean "archived",          limit: 1,   default: false
    t.string  "position",          limit: 255
    t.boolean "seeking",           limit: 1,   default: false
    t.integer "skill",             limit: 1,   default: 1,         null: false
    t.boolean "has_apprentice",    limit: 1,   default: false,     null: false
    t.date    "unavailable_until"
  end

  create_table "dbusers", force: :cascade do |t|
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
  end

  add_index "dbusers", ["email"], name: "index_dbusers_on_email", unique: true, using: :btree
  add_index "dbusers", ["reset_password_token"], name: "index_dbusers_on_reset_password_token", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "applicant_id", limit: 4
    t.text     "body",         limit: 65535
    t.datetime "created_at"
    t.string   "title",        limit: 255
    t.datetime "updated_at"
  end

  add_index "messages", ["applicant_id"], name: "index_messages_on_applicant_id", using: :btree

  create_table "monthly_apprentice_salaries", force: :cascade do |t|
    t.integer "duration", limit: 4,   null: false
    t.string  "location", limit: 255, null: false
    t.float   "amount",   limit: 24,  null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "body",         limit: 65535
    t.integer  "craftsman_id", limit: 4
    t.integer  "applicant_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "applicant_id", limit: 4
    t.integer  "craftsman_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
    t.integer  "craftsman_id",           limit: 4
    t.boolean  "employee",               limit: 1
    t.boolean  "admin",                  limit: 1,   default: false, null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,     null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

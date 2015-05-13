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

ActiveRecord::Schema.define(version: 5) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "bio"
    t.string  "password_hash"
    t.string  "encrypted_password"
    t.string  "api_key"
    t.integer "images_id"
    t.integer "projects_id"
    t.integer "charities_id"
  end

  add_index "admins", ["charities_id"], name: "index_admins_on_charities_id", using: :btree
  add_index "admins", ["images_id"], name: "index_admins_on_images_id", using: :btree
  add_index "admins", ["projects_id"], name: "index_admins_on_projects_id", using: :btree

  create_table "casestudies", force: :cascade do |t|
    t.integer "report_ids"
  end

  create_table "charities", force: :cascade do |t|
    t.string   "name"
    t.integer  "year_est"
    t.string   "description"
    t.string   "email"
    t.string   "website"
    t.string   "address"
    t.integer  "logo_image_id"
    t.float    "lat"
    t.float    "lng"
    t.integer  "images_id"
    t.integer  "projects_id"
    t.integer  "admins_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "charities", ["admins_id"], name: "index_charities_on_admins_id", using: :btree
  add_index "charities", ["images_id"], name: "index_charities_on_images_id", using: :btree
  add_index "charities", ["projects_id"], name: "index_charities_on_projects_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string  "name"
    t.string  "region"
    t.string  "description"
    t.float   "lat"
    t.float   "lng"
    t.integer "logo_image_id"
    t.integer "admins_id"
    t.integer "surveyors_id"
    t.integer "images_id"
    t.integer "case_studies_id"
  end

  add_index "projects", ["admins_id"], name: "index_projects_on_admins_id", using: :btree
  add_index "projects", ["case_studies_id"], name: "index_projects_on_case_studies_id", using: :btree
  add_index "projects", ["images_id"], name: "index_projects_on_images_id", using: :btree
  add_index "projects", ["surveyors_id"], name: "index_projects_on_surveyors_id", using: :btree

  create_table "surveyors", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "bio"
    t.string  "lat"
    t.string  "lng"
    t.string  "password_hash"
    t.string  "encrypted_password"
    t.string  "api_key"
    t.integer "casestudies_id"
    t.integer "images_id"
    t.integer "projects_id"
  end

  add_index "surveyors", ["casestudies_id"], name: "index_surveyors_on_casestudies_id", using: :btree
  add_index "surveyors", ["images_id"], name: "index_surveyors_on_images_id", using: :btree
  add_index "surveyors", ["projects_id"], name: "index_surveyors_on_projects_id", using: :btree

end

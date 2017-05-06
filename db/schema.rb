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

ActiveRecord::Schema.define(version: 20170430221358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "survey_id"
    t.integer  "question_id"
    t.integer  "user_id"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["survey_id"], name: "index_answers_on_survey_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "slug"
    t.text     "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "survey_id"
    t.index ["slug"], name: "index_questions_on_slug", using: :btree
    t.index ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.text     "slug"
    t.text     "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["slug"], name: "index_surveys_on_slug", using: :btree
    t.index ["user_id"], name: "index_surveys_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image"
    t.string   "token"
    t.string   "expires_at"
    t.integer  "group"
    t.text     "street_address"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["group"], name: "index_users_on_group", using: :btree
    t.index ["uid"], name: "index_users_on_uid", unique: true, using: :btree
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "surveys"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "surveys"
  add_foreign_key "surveys", "users"
end

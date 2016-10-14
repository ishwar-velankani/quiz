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

ActiveRecord::Schema.define(version: 20161012114611) do

  create_table "answers", force: :cascade do |t|
    t.integer  "input_answer", limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "question_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "question",     limit: 65535
    t.string   "op1",          limit: 255
    t.string   "op2",          limit: 255
    t.string   "op3",          limit: 255
    t.string   "op4",          limit: 255
    t.integer  "correct",      limit: 4
    t.integer  "input_answer", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "first_name",    limit: 65535
    t.string   "last_name",     limit: 255
    t.date     "date_of_birth"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
end

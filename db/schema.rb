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

ActiveRecord::Schema.define(version: 20190501135130) do

  create_table "activities", force: :cascade do |t|
    t.string  "date"
    t.integer "user_id"
    t.integer "student_id"
    t.string  "breakfast"
    t.string  "morning_snacks"
    t.string  "lunch"
    t.string  "afternoon_snacks"
    t.string  "sleep"
    t.string  "nappies"
    t.text    "comments"
  end

  create_table "students", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
    t.string  "key_person"
    t.string  "room"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "nursery_staff"
  end

end

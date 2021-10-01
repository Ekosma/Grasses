# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_26_221147) do

  create_table "periods", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.index ["user_id"], name: "index_periods_on_user_id"
  end

  create_table "student_periods", id: false, force: :cascade do |t|
    t.integer "students_id"
    t.integer "periods_id"
    t.index ["periods_id"], name: "index_student_periods_on_periods_id"
    t.index ["students_id"], name: "index_student_periods_on_students_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.string "favorite_color"
    t.string "favorite_food"
    t.text "student_comment"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "email"
    t.string "password_digest"
  end

  add_foreign_key "periods", "users"
  add_foreign_key "student_periods", "periods", column: "periods_id", on_delete: :cascade
  add_foreign_key "student_periods", "students", column: "students_id", on_delete: :cascade
end

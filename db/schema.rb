# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_18_101021) do

  create_table "study_book_tag_relations", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "study_book_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["study_book_id"], name: "index_study_book_tag_relations_on_study_book_id"
    t.index ["tag_id"], name: "index_study_book_tag_relations_on_tag_id"
  end

  create_table "study_books", force: :cascade do |t|
    t.integer "user_id"
    t.integer "study_type_id"
    t.string "book_name", null: false
    t.string "author"
    t.string "publisher"
    t.integer "price"
    t.string "remark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["study_type_id"], name: "index_study_books_on_study_type_id"
    t.index ["user_id"], name: "index_study_books_on_user_id"
  end

  create_table "study_types", force: :cascade do |t|
    t.string "type_name", null: false
    t.string "remark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.string "remark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "password_digest", null: false
    t.string "remember_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
  end

  add_foreign_key "study_book_tag_relations", "study_books"
  add_foreign_key "study_book_tag_relations", "tags"
  add_foreign_key "study_books", "study_types"
  add_foreign_key "study_books", "users"
end

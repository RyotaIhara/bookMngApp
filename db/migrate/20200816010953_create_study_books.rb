class CreateStudyBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :study_books do |t|
      t.references :user, foreign_key: true
      t.references :study_type, foreign_key: true
      t.string   "book_name", null: false
      t.string   "author", null: true
      t.string   "publisher", null: true
      t.integer  "price", null: true
      t.string   "remark", null: true

      t.timestamps
      t.datetime :deleted_at, null: true
    end
  end
end

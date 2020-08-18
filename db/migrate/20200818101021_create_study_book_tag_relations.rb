class CreateStudyBookTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :study_book_tag_relations do |t|
      t.references :tag, foreign_key: true
      t.references :study_book, foreign_key: true

      t.timestamps
    end
  end
end

class CreateStudyTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :study_types do |t|
      t.string :type_name, null: false
      t.string :remark, null: true

      t.timestamps
      t.datetime :deleted_at, null: true
    end
  end
end

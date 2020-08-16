class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :tag_name, null: false
      t.string :remark, null: true

      t.timestamps
      t.datetime :deleted_at, null: true
    end
  end
end

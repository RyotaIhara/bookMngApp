class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string   "user_name", null: false
      t.string   "password_digest", null: false
      t.string   "remember_token"

      t.timestamps
      t.datetime :deleted_at, null: true
    end
  end
end

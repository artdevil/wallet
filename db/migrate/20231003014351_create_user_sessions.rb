class CreateUserSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_sessions do |t|
      t.references :user, null: false
      t.string :token, null: false, unique: true
      t.datetime :expired_at, null: false

      t.timestamps
    end
  end
end

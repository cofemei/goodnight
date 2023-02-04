class CreateUserFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :user_follows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :follow, null: false, foreign_key: false

      t.timestamps
    end

    add_foreign_key :user_follows, :users, column: :follow_id
  end
end

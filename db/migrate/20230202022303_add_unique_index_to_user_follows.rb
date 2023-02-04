class AddUniqueIndexToUserFollows < ActiveRecord::Migration[6.1]
  def change
    #add_index :user_follows, [:user_id, :follow_id], unique: true
  end
end

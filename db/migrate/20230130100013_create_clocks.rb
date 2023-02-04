class CreateClocks < ActiveRecord::Migration[6.1]
  def change
    create_table :clocks do |t|
      t.boolean :is_bedtime
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

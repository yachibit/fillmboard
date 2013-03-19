class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.references :photo

      t.timestamps
    end
    add_index :likes, :photo_id
  end
end

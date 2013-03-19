class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body
      t.references :photo

      t.timestamps
    end
    add_index :comments, :photo_id
  end
end

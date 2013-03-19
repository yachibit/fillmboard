class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :adress

      t.timestamps
    end
  end
end

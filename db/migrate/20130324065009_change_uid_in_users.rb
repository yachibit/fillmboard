class ChangeUidInUsers < ActiveRecord::Migration
  def up
    change_column :users, :uid, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
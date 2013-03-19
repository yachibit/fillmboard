class AddGroupToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :group_id, :integer
  end
end

class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :body
      
      #t.string :photo_file_name
	    #t.integer :photo_file_size
	    #t.string :photo_content_type
	    #t.datetime :photo_updated_at 

      t.timestamps
    end
  end

end

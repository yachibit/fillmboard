class Photo < ActiveRecord::Base
  attr_accessible :body, :avatar, :album_id
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	belongs_to :album
	belongs_to :user
	has_many	:comments
	has_many	:likes
end

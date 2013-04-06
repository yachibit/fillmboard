class Photo < ActiveRecord::Base
  attr_accessible :body, :avatar, :album_id

  belongs_to :album
  belongs_to :user
  has_many  :comments, :dependent => :destroy
  has_many  :likes, :dependent => :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }
end
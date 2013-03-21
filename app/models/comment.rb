class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :photo_id

  belongs_to :photo
  belongs_to :user

  validates :body, :presence => true
end
class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  attr_accessible :body, :user_id, :photo_id
end

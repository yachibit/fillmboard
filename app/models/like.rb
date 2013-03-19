class Like < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  attr_accessible :user_id, :photo_id
end

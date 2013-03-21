class Album < ActiveRecord::Base
  attr_accessible :description, :name, :group_id

  belongs_to :group
  has_many :photos, :dependent => :destroy
end
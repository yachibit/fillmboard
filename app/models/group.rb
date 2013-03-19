class Group < ActiveRecord::Base
  attr_accessible :description, :name
  #has_many :photos, :dependent => :destroy
  has_many :albums, :dependent => :destroy
  has_many :user_relationships
  has_many :users, :through => :user_relationships

  validates :name, :presence => true, :uniqueness => true
end
class User < ActiveRecord::Base  
  attr_accessible :access_token, :name, :provider, :uid

  has_many :user_relationships
  has_many :groups, :through => :user_relationships
  has_many :photos, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.access_token = auth["credentials"]["token"]
      user.picture = auth["info"]["image"]
    end
  end

  def graph
    @graph ||= Koala::Facebook::API.new(access_token)
  end

  def invitable_friends_to_group(group)
    fb_friends_array = []
    group_friends_array = []

    friends = graph.get_connection("me", "friends")
    friends.each do |friend|
      fb_friends_array << friend["id"].to_i
    end

    group.users.each do |user|
      group_friends_array << user.uid
    end

    User.where(:uid => fb_friends_array - group_friends_array)
  end

end
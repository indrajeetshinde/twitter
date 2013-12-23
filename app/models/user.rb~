class User < ActiveRecord::Base
  has_many :tweets

  has_many :follower_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "follower_id"
  
  has_many :followers, through: :follower_relationships
  has_many :followeds, through: :followed_relationships

  has_secure_password
  attr_accessible :email, :password_digest,:password, :password_confirmation,:user_name
  validates_uniqueness_of :email,:user_name
  validates_presence_of :email, :user_name
 ##validates_presence_of :email  



def following? user
    self.followeds.include? user
end
 
def follow user
    Relationship.create follower_id: self.id, followed_id: user.id
end

  


end

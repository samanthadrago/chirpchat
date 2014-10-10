class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :chirps
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed, dependent: :destroy
  # has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  # has_many :followers, through: :reverse_relationships, source: :follower

  def followers
    rels = Relationship.where(followed_id: self.id)
    followers = []
    rels.each do |rel|
      followers << User.find(rel.follower_id)
    end
    followers
  end
end


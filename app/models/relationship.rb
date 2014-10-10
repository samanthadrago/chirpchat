class Relationship < ActiveRecord::Base
  attr_accessor :followed_id
  # Remember to create a migration!
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

end

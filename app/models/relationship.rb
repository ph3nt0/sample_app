class Relationship < ActiveRecord::Base
  attr_accessible :followed_id
	
  # A követőnek és a követettnek is 'User'-nek kell lennie
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # Léteznie kell a follower_id és a followed_id változóknak is
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end

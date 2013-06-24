class Micropost < ActiveRecord::Base
  attr_accessible :content
  # Minden micropost egy adott felhasználóhoz kell, hogy tartozzon
  belongs_to :user

  # Minden micropostnak kell lennie user_id-jének...
  validates :user_id, presence: true
  # ... valamint contentjének, és ez a tartalom nem lehet hosszabb 140 karakternél
  validates :content, presence: true, length: { maximum: 140 }

  # A legújabb posztokat mutassuk először (ami a legutolsó az adatbázisban)
  default_scope order: 'microposts.created_at DESC'

  def self.from_users_followed_by(user)
	followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
	where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end
end
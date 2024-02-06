class User < ApplicationRecord
  before_save { self.email = email.downcase}
  has_many :articles

  validates :username, presence:true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum:25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: {minimum: 5, maximum: 100}, format: {with: VALID_EMAIL_REGEX}

  has_secure_password

  has_many :followers, class_name: 'UserFollower', foreign_key: :follower_id
  has_many :following, class_name: 'UserFollowing', foreign_key: :follower_id

  # def follow(following, user)
  #   UserFollower.create!(follower_id: user, followed_id: following)
  # end

  # def unfollow(user)
  #   UserFollowing.find_by(followed_id: user.id).destroy
  # end

  # def following?(user)
  #   UserFollowing.exists?(followed_id: user.id)
  # end
end

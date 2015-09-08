class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  validates :email, presence: true, uniqueness: true,
          format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i


def liked_idea?(idea)
  liked_ideas.include?(idea)
end
end

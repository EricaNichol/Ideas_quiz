class Idea < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :title, presence: {message: "Must have a title"}

  def like_for(user)
    likes.find_by_user_id(user.id)
  end

  def user_name
   if user
     user.first_name
   else
     "Anonymous"
   end
 end
end

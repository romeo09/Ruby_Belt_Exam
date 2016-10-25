class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked_post, through: :likes, source: :user

  validates :content, :presence => true
end

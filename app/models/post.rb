class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked_post, through: :likes, source: :user

  validates :content, :presence => true

  def self.top
     order('users_liked_post DESC')
  end
end

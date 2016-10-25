class LikesController < ApplicationController
  def create
     post = Post.find(params['post_id'])
     like = Like.create(user: current_user, post: post)
     redirect_to :back
  end

  def destroy
     like = Like.where(post_id: params['post_id'], user_id: session[:user_id]).first.destroy
     redirect_to :back
  end
end

class LikesController < ApplicationController
  def create
     post = Post.find(params[:post_id])
     like = Like.create(user: current_user, post: post)
     @likes_add = post.likes_count
     @likes_add = @likes_add +1
     post.update(likes_count: @likes_add)
     redirect_to ("/posts/index/#{current_user.id}")
  end

  def destroy
     like = Like.where(post_id: params[:post_id], user_id: session[:user_id]).first.destroy
     redirect_to :back
  end
end

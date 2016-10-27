class PostsController < ApplicationController
  def index
     @most_likes = Post.top
     @posts = Post.all.order(@most_likes)
     @user = User.find(params[:id])
  end

  def show
     @user = User.where(session[:user_id]).all
     @post = Post.find(params[:id])
     @liked_ideas = Post.first.users_liked_post
  end

  def new

  end

  def create
     current_user = User.where(id: session[:user_id]).first
     post = Post.new(content: post_params[:content], user: current_user )
       flash["success"] = "Your Post Has Been Added!"
       if post.save
          redirect_to :back
       else
          flash[:errors] = @posts.errors.full_messages
          redirect_to :back
       end
  end

  def destroy
     post = Post.destroy(params[:id])
     post.destroy if post.user == current_user
     redirect_to :back
  end

  private
  def post_params
     params.require(:post).permit(:content)
  end
end

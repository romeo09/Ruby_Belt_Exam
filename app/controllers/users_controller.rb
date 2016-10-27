class UsersController < ApplicationController
   before_action :require_login, except: [:new, :create]
   before_action :require_correct_user, only: [:show, :destroy]
  def new

  end

  def show
     @user = User.find(params[:id])
     @posts = Post.where(user: @user).all
     @posts_liked = @user.posts_liked.count
  end
  def create
     @user = User.new(user_params)
     if @user.save
        session[:user_id] = @user.id
        redirect_to ("/posts/index/#{@user.id}")
     else
        flash[:errors] = @user.errors.full_messages
        redirect_to :back
     end
  end
  def destroy
    @user = User.destroy(params[:id])
    session[:user_id] = nil
    redirect_to :root
  end

  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end
end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      flash[:notice] = "Signed up successfully as #{@new_user.username} !"
      redirect_to articles_path
    else
      redirect_to 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'Profile updated successfully!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

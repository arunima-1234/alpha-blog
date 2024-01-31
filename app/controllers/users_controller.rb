class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new()
  end

  def create
    @new_user = User.create!(user_params)
    if @new_user.persisted?
      session[:user_id] = @new_user.id
      flash[:notice] = "Signed up successfully as #{@new_user.username} !"
      redirect_to articles_path
    else
      redirect_to 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Profile updated successfully!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user_articles = @user.articles
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

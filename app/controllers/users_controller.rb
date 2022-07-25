class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])

  end


  protected

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

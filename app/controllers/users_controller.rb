class UsersController < ApplicationController

  before_action :ensure_correct_user, {only: [:edit, :update]}
  def ensure_correct_user
  	if current_user.id != params[:id].to_i
  		redirect_to user_path(current_user.id)
  	end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "you have update user successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

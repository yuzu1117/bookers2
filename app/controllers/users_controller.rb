class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @use.books
  end

  def edit
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end

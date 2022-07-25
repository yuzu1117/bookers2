class BooksController < ApplicationController
  
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to '/books'
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to '/books'
  end

  protected

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.(@user_id)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @books = Book.all
    redirect_to book_path(@book)

  end

  def edit
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

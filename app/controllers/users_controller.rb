class UsersController < ApplicationController
def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @user =current_user
    @user_aot = User.find(params[:id])
    @books = Book.where(user_id: @user_aot.id)
    @book = Book.new
    
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @books = Book.all
    redirect_to book_path(@book.id)

  end

  def edit
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introd)
  end
  
end

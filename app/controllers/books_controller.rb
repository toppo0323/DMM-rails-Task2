class BooksController < ApplicationController

before_action :authenticate_user!
before_action :ensure_current_user, {only: [:edit,:update,:destroy]}

 

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id

      if @book.save
        flash[:succes]= "You have created book successfully."
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        flash[:notice] = ' errors prohibited this obj from being saved:'
        render :index
      end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @showbook = Book.find(params[:id])
    @user = @showbook.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
         flash[:succes]= "You have created book successfully."
        redirect_to books_path(@book.id)
      else
      flash[:notice]= ' errors prohibited this obj from being saved:'
        render edit
      end
  end



  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
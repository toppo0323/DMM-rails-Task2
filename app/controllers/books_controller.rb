class BooksController < ApplicationController

before_action :authenticate_user!


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
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end

  def edit
   @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
      if @book.update(book_params)
         flash[:succes]= "You have created book successfully."
        redirect_to book_path(@book.id)
      else
      flash[:notice]= ' errors prohibited this obj from being saved:'
        render:edit
      end
  end



  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
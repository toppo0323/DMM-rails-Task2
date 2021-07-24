class UserController < ApplicationController

before_action :authenticate_user!
before_action :ensure_current_user, {only: [:edit,:update,:destroy]}

  def new
    @book = Book.new
  end


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
     if @user.save
         flash[:succes]= "You have updated user successfully."
        redirect_to user_path(current_user.id)
     else
        render :edit
     end
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def  ensure_current_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
     redirect_to user_path(current_user.id)
    end
  end
  
  end

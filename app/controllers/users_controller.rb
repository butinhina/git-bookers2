class UsersController < ApplicationController

  def new
    @user = User.new(user_params)
    @user = current_user.id
    if @user.save
      flash[:notice] = "Welcome! You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)

    end
  end

  def index
    @user=current_user
    @users=User.all
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def update
    @user=User.find(params[:id])
    @user=current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def delet
    flash[:notice] = "Signed out successfully."
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end



end


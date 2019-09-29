class UsersController < ApplicationController
 before_action :authenticate_user!, only: [:index, :show, :create, :edit, :update] 

  def show
  	 @book = Book.new
  	 @user = User.find(params[:id])
     @books = Book.where(user_id: @user) 
     # @books = @user.book
  end

  def edit
  	 @user = User.find(params[:id])
     if @user != current_user
      redirect_to user_path(current_user)
    end
  end


  def new
  	 @user = User.new
  end

  def update
     @user = User.find(params[:id])  
     if @user.update(user_params)
        flash[:notice] = "successfully"
        redirect_to user_path(@user.id)
      else
        render :edit
      end
  end

  def index
      @book = Book.new
      @user = current_user
      @users = User.all      
  end
 private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end



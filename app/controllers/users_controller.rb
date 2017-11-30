class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def favorites
    if current_user
      @favorites = current_user.saved_recipes
    else
      flash[:alert] = "You must be logged in to access your favorite recipes."
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :password_digest, :display_name)
  end

end

class FavoritesController < ApplicationController

  def index
    if current_user
      @favorites = current_user.favorites
    else
      flash[:alert] = "You must be logged in to access your favorite recipes."
      redirect_to :back
    end
  end

end

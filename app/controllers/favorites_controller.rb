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

# I dont think this controller is ever being accessed. If it is unused, clear
# it out of the production branch. Alternatively, you could modify your member routes
# in `routes.rb` to point to this controller instead.

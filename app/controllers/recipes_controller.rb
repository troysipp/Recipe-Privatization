class RecipesController < ApplicationController

  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
  # ^ except: [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.user = current_user
    # You shouldn't need to set the association with user here since you are doing it
    # in create
  end

  def create
    @recipe = Recipe.create(recipe_params.merge(user: current_user))
    # No bang operator (`!`) on create or it will throw an error on validation failing. Instead,
    # you should use `.new()` and `.save()` in conjunction with an if...else to control for
    # validation returning false if it fails and letting the user know something needs fixing
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if !@recipe.user == current_user
      flash[:alert] = "Only the member who submitted this recipe can edit it."
      redirect_to recipe_path(@recipe)
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
    # You need to also verify permissions here (just like you did in edit). Potentially
    # look into CanCanCan or another authorization gem to abstract this out if you prefer.
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
      @recipe.destroy
    else
      flash[:alert] = "Only the member who submitted this recipe can delete it."
    end
    redirect_to recipes_path
  end

  def add_favorite
    @recipe = Recipe.find(params[:id])
    if Favorite.all.include? @recipe
      # I think you need to modify the above criteria. It looks like you are asking
      # whether or not *any* Favorite exists that includes this recipe. Instead, ask
      # does a recipe exist that includes the recipe AND the current user:
      # Favorite.find_by(recipe: @recipe, user: current_user)
      return
      # Also, even if the Favorite already exists, you probably want a redirect to
      # the favorites view anyway, so no `return` statement here
    else
      @favorite_recipe = Favorite.create(recipe: @recipe, user: current_user)
    end
    redirect_to favorites_user_path
  end

  def remove_favorite
    @recipe = Recipe.find(params[:id])
    @favorite = current_user.saved_recipes.find_by(recipe: @recipe)
    @favorite.destroy
    redirect_to favorites_user_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :instructions, :user)
  end

end

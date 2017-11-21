class RecipesController < ApplicationController

  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    if @recipe.user == current_user
      redirect_to new_recipe_path(@recipe)
    else
      flash[:alert] = "Only members can submit recipes."
      redirect_to recipes_path
    end
  end

  def create
    @recipe = Recipe.create!(recipe_params.merge(user: current_user))
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Only the member who submitted this recipe can edit it."
      redirect_to recipe_path(@recipe)
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
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

  private
  def recipe_params
    params.require(:recipe).permit(:title, :instructions)
  end

end

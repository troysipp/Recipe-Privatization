class CommentsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.new
    @comment.user = current_user

    # if @recipe.user == current_user
    #   redirect_to new_recipe_comment_path(@recipe, @comment)
    # else
    #   flash[:alert] = "Only members can comment on recipes."
    #   redirect_to recipe_path(@recipe)
    # end
  end


  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.comments.create!(comment_params.merge(user: current_user))
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    if @recipe.user == current_user
      redirect_to edit_recipe_comment_path(@recipe, @comment)
    else
      flash[:alert] = "Only the member who submitted this comment can edit it."
      redirect_to recipe_path(@recipe)
    end
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(paramd[:id])
    if @recipe.user == current_user
      @comment.destroy
    else
      flash[:alert] = "Only the member who submitted this comment can delete it."
    end
    redirect_to recipe_path(@recipe)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end

class AddRecipeToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :recipe, foreign_key: true
  end
end

class AddCommentToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipes, :comment, foreign_key: true
  end
end

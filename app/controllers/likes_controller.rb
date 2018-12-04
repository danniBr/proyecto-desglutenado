class LikesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @like = Like.new(user: current_user, recipe: @recipe)
    respond_to do |format|
      if @like.save
        @new_likes_count = @recipe.likes.count
        format.html { redirect_to @recipe, notice: 'Me gusta' }
        format.js
      end
      else
        @new_likes_count = @recipe.likes.count
        format.html { redirect_to @recipe, notice: 'Me gusta falló' }
    end
  end
end

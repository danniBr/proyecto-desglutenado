class LikesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

def create
  @recipe = Recipe.find(params[:recipe_id])
  @like = Like.new(user: current_user, recipe: @recipe)
  if @like.save
    redirect_to recipes_path
  else
    redirect_to root_path
  end
end



end

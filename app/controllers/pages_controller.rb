class PagesController < ApplicationController
  def index
    @recipes = Recipe.order('created_at desc').limit(4)
  end
end

class PagesController < ApplicationController
  def index
    @recipes = Recipe.order('created_at desc').limit(4)
    @locations = Location.order('created_at desc').limit(5)
  end
end

class PagesController < ApplicationController
  skip_authorization_check
  
  def index
    @recipes = Recipe.order('created_at desc').limit(4)
    @locations = Location.order('created_at desc').limit(5)
  end
end

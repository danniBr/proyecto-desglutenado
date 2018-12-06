class PagesController < ApplicationController
  skip_authorization_check

  def index
    @recipes = Recipe.order('created_at desc').limit(4)
    @questions = Question.order('created_at desc').limit(4)

    if params[:latitude].present? && params[:longitude].present?
      @locations = Location.near(
        [params[:latitude], params[:longitude]],
        100,
        units: :km
      ).limit(3)
    else
      @locations = Location.order('created_at desc').limit(3)
    end

    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
    end
  end
end

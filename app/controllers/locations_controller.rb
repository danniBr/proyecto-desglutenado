class LocationsController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :create]

  def findaddress
	@address = Geocoder.address([params[:latitude], params[:longitude]] )
  end	
 

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
   @location = Location.new(location_params)
     @location.user = current_user
     respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    respond_to do |format|
      format.js
    end
  end


  private def location_params
    params.require(:location).permit(:title, :description, :location, :latitude, :longitude, :user_id)
  end

end

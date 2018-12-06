class LocationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  load_and_authorize_resource

  def findaddress
	  @address = Geocoder.address([params[:latitude], params[:longitude]] )
  end


  def index
    #@locations = Location.all
    if params[:latitude].present? && params[:longitude].present?
      @locations = Location.near(
        [params[:latitude], params[:longitude]],
        10,
        units: :km
      )
    else
      @locations = Location.all
    end

    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
    marker.lat location.latitude
    marker.lng location.longitude
end
  end

  def new
    @location = Location.new
  end

  def create
   @location = Location.new(location_params)
     @location.user = current_user
     respond_to do |format|
      if @location.save
        format.html { redirect_to locations_path, notice: 'location was successfully created.' }
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

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to locations_path, notice: 'La dirección fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private def location_params
    params.require(:location).permit(:title, :description, :location, :latitude, :longitude, :user_id)
  end

end

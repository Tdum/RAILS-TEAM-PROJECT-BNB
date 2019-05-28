class PlacesController < ApplicationController
  before_action :place_find, only: [:show, :edit, :update, :destroy]

  def index
    # @places = Place.all
    @places = Place.where.not(latitude: nil, longitude: nil)

    @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end


  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def place_params
    params.require(:place).permit(:address, :party_type, :name, :description, :guest_capacity, :price, :photo, :lattitude, :longitude)
  end

  def place_find
    @place = Place.find(params[:id])
  end
end

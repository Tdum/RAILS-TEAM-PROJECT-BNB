class PlacesController < ApplicationController
  # before_action :place_find, only: [:show, :edit, :update, :destroy]
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
    if params[:query].present?
      @query = params[:query]
      @places = Place.where("name iLike '%#{params[:query]}%'")
    else
      @places = Place.all
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def place_params
    params.require(:place).permit(:address, :party_type, :name, :description, :guest_capacity, :price, :photo, :lattitude, :longitude)
  end

  # def place_find
  #   @place = Place.find(params[:id])
  # end
end

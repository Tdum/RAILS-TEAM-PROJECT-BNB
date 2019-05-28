class PlacesController < ApplicationController
  before_action :place_find, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      if Place.where.not(latitude: nil, longitude: nil)
        @places = Place.where("name iLike '%#{params[:query]}%'")
      end
    else
      @places = Place.where.not(latitude: nil, longitude: nil)
      @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
      end
    end
  end

  # def show
  # if params[:query].present?
  #     @query = params[:query]
  #     if Place.where.not(latitude: nil, longitude: nil)
  #       @places = Place.where("name iLike '%#{params[:query]}%'")
  #     end
  #   else
  #     @places = Place.where.not(latitude: nil, longitude: nil)
  #     @markers = @places.map do |place|
  #     {
  #       lat: place.latitude,
  #       lng: place.longitude
  #     }
  #     end
  #   end

  # end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def show
    @review = Review.new
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

class PlacesController < ApplicationController
  # before_action :place_find, only: [:show, :edit, :update, :destroy]
  def index
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

class PlacesController < ApplicationController
  before_action :place_find, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to place_path(@place)
    else
      render 'places/new'
    end
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

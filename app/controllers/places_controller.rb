class PlacesController < ApplicationController
  before_action :place_find, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      if Place.where.not(latitude: nil, longitude: nil)
        @places = Place.where("name iLike '%#{params[:query]}%'")
        @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
         infoWindow: render_to_string(partial: "infowindow", locals: { place: place })
      }
        end
      end
    else
      @places = Place.where.not(latitude: nil, longitude: nil)
      @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { place: place }),
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
      end
    end
  end

  def show
  gon.dates = @place.bookings.map { |booking| booking.date.to_s }
  @review = Review.new
  @booking = Booking.new
    # if Place.where.not(latitude: nil, longitude: nil)

      # @place = Place.where.not(latitude: nil, longitude: nil)
    @markers = [{
      lat: @place.latitude,
      lng: @place.longitude,
    }]
  end

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

  # def show
  #   @review = Review.new
  # end

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

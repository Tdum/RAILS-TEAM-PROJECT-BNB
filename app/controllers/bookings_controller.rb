class BookingsController < ApplicationController
    before_action :place_find, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show

  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.place = Place.find(params[:id])
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:guests, :date, :booking_type)
  end

  def booking_find
    @booking = Booking.find(params[:id])
  end
end

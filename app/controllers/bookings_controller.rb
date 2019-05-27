class BookingsController < ApplicationController
    before_action :place_find, only: [:show, :edit, :update, :destroy]

  def index
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

  def booking_params
    params.require(:booking).permit(:guests, :date, :booking_type)
  end

  def booking_find
    @booking = Booking.find(params[:id])
  end
end

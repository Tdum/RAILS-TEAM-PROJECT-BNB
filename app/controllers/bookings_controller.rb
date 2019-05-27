class BookingsController < ApplicationController

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

  def place_params
    params.require(:booking).permit(:guests, :date, :booking_type)
  end

  def place_find
    @booking = Booking.find(params[:id])
  end
end

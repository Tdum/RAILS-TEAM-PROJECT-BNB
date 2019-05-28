class ReviewsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @review = Review.new(review_params)
    @review.place = @place
    if @review.save
     redirect_to place_path(@place)
    else
     render 'places/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :note)
  end
end

class ReviewsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @review = Review.new(review_params)
    @review.place = @place
    if @review.save
      respond_to do |format|
        format.html { redirect_to place_path(@place) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'places/show' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
      @review = Review.find(params[:id])
      @review.destroy
      respond_to do |format|
        format.html { render 'places/show' }
        format.js
      end
  end

  private

  def review_params
    params.require(:review).permit(:content, :note)
  end
end

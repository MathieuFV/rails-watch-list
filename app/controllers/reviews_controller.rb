class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review = @list.reviews.new(review_params)

    if @review.save
      redirect_to list_path(@list), notice: 'Review was successfully created.'
    else
      redirect_to list_path(@list), alert: 'There was an error creating the review.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

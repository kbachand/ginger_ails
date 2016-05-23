class ReviewsController < ApplicationController
before_action :set_review, only: [:update, :edit, :destroy]

def create
	# Need to call student correctly

	@review = Review.new(review_params)
	if @review.save
	respond_to do |format|
		format.html {redirect_to ailment_path(@review.ailment_id), notice: "Post Created"}
	  end
      else
	redirect_to ailment_path(@review.ailment_id), notice: "Something went wrong"
    end
end

def edit	
end

def update	
end

def destroy
end

def new
	@review = Review.new
end

private

def review_params
	params.require(:review).permit(:author, :content, :ailment_id, :user_id)
end

def set_post
	@review = Review.find(params[:id])
end

end

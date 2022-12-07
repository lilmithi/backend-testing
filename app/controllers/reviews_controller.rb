class ReviewsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found

    def show
        review = find_review
        render json: review, status: :ok
    end

    def create
        review=Review.create(review_params)
    end

    def destroy
        review = find_review
        review.destroy
        render json: {}, status: :no_content
    end

    private

    def find_review
        Review.find(params[:id])
    end

    def review_params
        params.permit(:description)
    end

    def render_response_not_found
        render json: {error: "Review not found!"}, status: :not_found
    end
end

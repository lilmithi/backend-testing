class MoviesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response

    def index
        movies = Movie.all
        render json: movies, status: :ok
    end

    def show
        movie = find_movie
        render json: movie, status: :ok
    end

    def create
        movie = Movie.create!(movie_params)
        render json: movie, status: :created
    end

    def destroy
        movie = Movie.find(movie_params)
        movie.destroy
        render json: {}, status: :no_content
    end

    private

    def movie_params
        params.permit(:title, :movie_image, :director, :year, :genre, :movie_description, :rating, :quality)
    end

    def find_movie
        Movie.find(params[:id])
    end

    def render_response_not_found
        render json: {error: "Movie not found!"}, status: :not_found
    end

    def render_unproccessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end

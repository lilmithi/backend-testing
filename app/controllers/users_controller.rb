class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response

    def index
        users=User.all
        render json: user, status: :ok
    end

    def show
        user=find_user
        render json: user, status: :ok
    end

    def create
        user=User.create!(user_params)
        render json: user, status: :created
    end

    def update
        user=find_user
        user.update!(:user_name, :user_image)
        render json: user
    end

    private

    def user_params
        params.permit(:user_name, :user_image, :password)
    end

    def find_user
        User.find(params[:id])
    end

    def render_response_not_found
        render json: {error: "User not found!"}, status: :not_found
    end

    def render_unproccessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end

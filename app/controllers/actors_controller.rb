class ActorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response

    def index
        actors = Actor.all
        render json: actors, status: :ok
    end

    def show
        actor= find_actor
        render json: actor, status: :ok
    end
 
    def create
        actor = Actor.create!(actor_params)
        render json: :actor, status: :created
    end

    def destroy
        actor = find_actor
        actor.destroy
        render json: {}, status: :no_content
    end

    private

    def find_actor
        Actor.find(params[:id])
    end

    def actor_params
        params.permit(:actor_name, :sex)
    end

    def render_response_not_found
        render json: {error: "Actor not found!"}, status: :not_found
    end

    def render_unproccessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end

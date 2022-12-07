class CreateActorMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :actor_movies do |t|
      t.integer "movie_id"
      t.integer "actor_id"
      t.timestamps
    end
  end
end

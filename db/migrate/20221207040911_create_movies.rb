class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string "title"
      t.string "movie_image"
      t.string "genre"
      t.integer "actor_id"
      t.string "director"
      t.string "movie_description"
      t.integer "year"
      t.string "quality"
      t.integer "rating"
      t.timestamps
    end
  end
end

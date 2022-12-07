class Movie < ApplicationRecord
    GENRES = ['Comedy', 'Drama', 'Animation', 'Mystery', 'Horror', 'Fantasy', 'Action', 'Documentary', 'Science Fiction', 'Action', 'Crime']
    QUALITIES = ['HD', 'CAM', '720p', '1080p', '480p', 'ultra HD']
    validates :title, :movie_image, :director, presence: true

    validates :year, numericality: {
    greater_than_or_equal_to: 1888,
    less_than_or_equal_to: Date.today.year
    }

    validates :genre, inclusion: {
    in: GENRES,
    message: "must be one of: #{GENRES.join(', ')}"
    }

    validates :rating, { :length => { :in => 0..10 } }

    validates :quality, inclusion: {
    in: QUALITIES,
    message: "must be one of: #{QUALITIES.join(', ')}"
    }

    has_many :users, through: :user_movies
    has_many :actors, through: :actor_movies

end

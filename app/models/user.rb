class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    has_many :movies, through: :user_movies
    has_many :reviews
end

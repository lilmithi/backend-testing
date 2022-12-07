class Actor < ApplicationRecord
    has_many :movies, through: :actor_movies
    SEXES = ['male', 'Male', 'female', 'Female', 'custom', 'Custom']

    validates :actor_name, :sex, presence: true
    validates :actor_name, uniqueness: true

    validates :sex, inclusion: {
    in: SEXES,
    message: "must be one of: #{SEXES.join(', ')}"
    }

end

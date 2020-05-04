class Gym < ActiveRecord::Base
    has_many :workouts
    has_many :trainers, through: :workouts
    has_many :users, through: :workouts
end 
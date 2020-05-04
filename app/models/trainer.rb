class Trainer < ActiveRecord::Base
    has_many :workouts
    has_many :users, through: :workouts
    has_many :gyms, through: :workouts
end 
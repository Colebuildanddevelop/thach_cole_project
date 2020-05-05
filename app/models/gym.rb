class Gym < ActiveRecord::Base
    has_many :workouts
    has_many :trainers, through: :workouts
    has_many :users, through: :workouts

    def self.most_user
        Gym.all.max_by {|g| g.users.length}
    end 
    
    def self.least_user
        Gym.all.min_by {|g| g.users.length}
    end 
end 





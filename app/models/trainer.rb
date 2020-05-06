class Trainer < ActiveRecord::Base
    has_many :workouts
    has_many :users, through: :workouts
    has_many :gyms, through: :workouts

def total_calories_burned
    self.workouts.map {|w| w.calories_burned}.sum
end 

def self.most_calories_burned
    
    self.all.max_by {|t| t.total_calories_burned}
end 

def num_workouts_with_weight_lifting
    
    a = self.workouts.select {|t| t.workout_type == "weight_lifting"}
    a.length
end 

def self.most_experience_with_lifting
    self.all.max_by {|t| t.num_workouts_with_weight_lifting}
end 

def effective_rate
    self.cost_per_hour / self.workouts.length
end  

def self.most_effective_rate
    self.all.max_by {|t| t.effective_rate}
end
end 
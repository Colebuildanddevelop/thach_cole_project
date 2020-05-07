class User < ActiveRecord::Base
  has_many :workouts
  has_many :trainers, through: :workouts
  has_many :gyms, through: :workouts

  def total_weight_for_all_workouts
    self.workouts.map { |workout| workout.total_weight_lifted }.sum
  end

  def average_weight_for_all_workouts
    
    num_of_workouts_session = self.workouts.length
    self.total_weight_for_all_workouts / num_of_workouts_session
  end

  def average_calories_burned
    total_c_burned = self.workouts.map {|w| w.calories_burned}.sum
    num_of_workouts_session = self.workouts.length
    total_c_burned / num_of_workouts_session

  end

  def diet_plan_suggestion
    if self.average_weight_for_all_workouts >= 200 && self.average_calories_burned >= 1000
        return "plan A: 2500 calories, 100g protein, 300g carb"
    elsif self.average_weight_for_all_workouts >= 200 && self.average_calories_burned < 1000
        return "plan B: 2000 calories, 90g protein, 200g carb"
    else
        return "plan C: 1500 calories, 60g protein, 100g carb"
    end 
  end 

  def trainer_suggestion
    if self.desired_workout == "low-intensity"
        a = Trainer.all.select {|t| t.temperament == "calm"}
        return a.map {|t| t.name}
    elsif self.desired_workout == "mild"
        a = Trainer.all.select {|t| t.temperament == "mild"}
        return a.map {|t| t.name}
    elsif self.desired_workout == "intense"
        a = Trainer.all.select {|t| t.temperament == "intense"}
        return a.map {|t| t.name}
    end 
end

  
end 
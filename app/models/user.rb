class User < ActiveRecord::Base
  has_many :workouts
  has_many :trainers, through: :workouts
  has_many :gyms, through: :workouts

  def total_weight_for_all_workouts
    self.workouts.map { |workout| workout.total_weight_lifted }.sum
  end

end 
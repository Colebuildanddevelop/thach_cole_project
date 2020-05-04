class Workouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :user_id 
      t.integer :trainer_id
      t.integer :gym_id
      t.integer :total_weight_lifted
      t.string :diet_plan
      t.integer :calories_burned
      t.integer :duration_of_workout_minutes
    end 
  end
end

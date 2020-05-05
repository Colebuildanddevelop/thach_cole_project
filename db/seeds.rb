User.delete_all
Gym.delete_all
Trainer.delete_all
Workout.delete_all


jack = User.create(name: "Jack", age: 18, desired_workout: "intense", gender: "M")
ally = User.create(name: "Ally", age: 55, desired_workout: "low-intesity", gender: "F")
sally = User.create(name: "Sally", age: 35, desired_workout: "mild", gender: "F")

gym_1 = Gym.create(name: "Gold's Gym", facility: "Weight Lifting")
gym_2 = Gym.create(name: "24 Hour Fitness", facility: "Universal")
gym_3 = Gym.create(name: "Runner's Gym", facility: "Cardio")

david = Trainer.create(:name=>"David", :specialty=>"muscle_gain", :temperament=>"intense", :cost_per_hour=>50)
jess = Trainer.create(:name=>"Jess", :specialty=>"weight_loss", :temperament=> "mild", :cost_per_hour=> 40)
anna = Trainer.create(:name=>"Anna", :specialty=>"well_being", :temperament=>"calm", :cost_per_hour=>45)

workout_1 = Workout.create(total_weight_lifted: 100, diet_plan: "Keto", calories_burned: 500, duration_of_workout_minutes: 60)
workout_2 = Workout.create(total_weight_lifted: 300, diet_plan: "Palio", calories_burned: 1000, duration_of_workout_minutes: 30)
workout_3 = Workout.create(total_weight_lifted: 50, diet_plan: "Carnivore", calories_burned: 2000, duration_of_workout_minutes: 120)

jack.workouts << workout_1 
jack.workouts << workout_2 

gym_1.workouts << workout_1
gym_2.workouts << workout_2 

david.workouts << workout_1
jess.workouts << workout_2
david.workouts << workout_3


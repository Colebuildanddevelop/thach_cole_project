User.delete_all
Gym.delete_all
Trainer.delete_all
Workout.delete_all


jack = User.create(name: "Jack", username: "jack", password: "123", age: 18, desired_workout: "intense")
ally = User.create(name: "Ally", username: "ally", password: "345", age: 55, desired_workout: "low-intesity")
sally = User.create(name: "Sally", username: "sally", password: "222", age: 35, desired_workout: "mild")
aaron = User.create(name: "Aaron", username: "aaron", password: "234", age: 30, desired_workout: "intermediate")
emily = User.create(name: "Emily", username: "emily", password: "111", age: 26, desired_workout: "mild")
john = User.create(name: "John", username: "john", password: "1234", age:45, desired_workout: "intermediate")
eric = User.create(name: "Eric", username: "eric", password: "5555", age:22, desired_workout: "intense")
kun = User.create(name: "Kun", username: "kun", password: "21312", age:30, desired_workout: "mild")
tobi = User.create(name: "Tobi", username: "tobi", password: "21a", age: 29, desired_workout: "intense")
nick = User.create(name: "Nick", username: "nick", password: "rafd", age: 38, desired_workout: "mild")

gym_1 = Gym.create(name: "Gold's Gym", facility: "Weight Lifting")
gym_2 = Gym.create(name: "24 Hour Fitness", facility: "Universal")
gym_3 = Gym.create(name: "Runner's Gym", facility: "Cardio")
gym_4 = Gym.create(name: "Planet Fitness", facility: "Weight Lifting")

david = Trainer.create(name: "David", specialty: "muscle_gain", temperament: "intense", cost_per_hour: 50)
jess = Trainer.create(name: "Jess", specialty: "weight_loss", temperament:  "mild", cost_per_hour:  40)
anna = Trainer.create(name: "Anna", specialty: "well_being", temperament: "calm", cost_per_hour: 45)
ryan = Trainer.create(name: "Ryan", specialty: "muscle_gain", temperament: "mild", cost_per_hour: 60)

workout_1 = Workout.create(total_weight_lifted: 100, workout_type: "weight_lifting", calories_burned: 500, duration_of_workout_minutes: 60)
workout_2 = Workout.create(total_weight_lifted: 300, workout_type: "cardio", calories_burned: 1000, duration_of_workout_minutes: 30)
workout_3 = Workout.create(total_weight_lifted: 50, workout_type: "mixed", calories_burned: 2000, duration_of_workout_minutes: 120)
workout_4 = Workout.create(total_weight_lifted: 120, workout_type: "mixed", calories_burned: 1400, duration_of_workout_minutes: 100)
workout_5 = Workout.create(total_weight_lifted: 80, workout_type: "mixed", calories_burned: 1200, duration_of_workout_minutes: 70)
workout_6 = Workout.create(total_weight_lifted: 200, workout_type: "weight_lifting", calories_burned: 2000, duration_of_workout_minutes: 90)
workout_7 = Workout.create(total_weight_lifted: 210, workout_type: "mixed", calories_burned: 600, duration_of_workout_minutes: 120)
workout_8 = Workout.create(total_weight_lifted: 200, workout_type: "weight_lifting", calories_burned: 2000, duration_of_workout_minutes: 90)
workout_9 = Workout.create(total_weight_lifted: 400, workout_type: "mixed", calories_burned: 1200, duration_of_workout_minutes: 90)
workout_10 = Workout.create(total_weight_lifted: 120, workout_type: "weight_lifting", calories_burned: 800, duration_of_workout_minutes: 80)
workout_11 = Workout.create(total_weight_lifted: 340, workout_type: "weight_lifting", calories_burned: 1900, duration_of_workout_minutes: 90)
workout_12 = Workout.create(total_weight_lifted: 50, workout_type: "weight_lifting", calories_burned: 2200, duration_of_workout_minutes: 110)
workout_13 = Workout.create(total_weight_lifted: 80, workout_type: "mixed", calories_burned: 1400, duration_of_workout_minutes: 70)
workout_14 = Workout.create(total_weight_lifted: 90, workout_type: "cardio", calories_burned: 1500, duration_of_workout_minutes: 80)
workout_15 = Workout.create(total_weight_lifted: 200, workout_type: "weight_lifting", calories_burned: 500, duration_of_workout_minutes: 90)
workout_16 = Workout.create(total_weight_lifted: 340, workout_type: "mixed", calories_burned: 800, duration_of_workout_minutes: 60)
workout_17 = Workout.create(total_weight_lifted: 50, workout_type: "mixed", calories_burned: 1100, duration_of_workout_minutes: 100)
workout_18 = Workout.create(total_weight_lifted: 70, workout_type: "weight_lifting", calories_burned: 1000, duration_of_workout_minutes: 120)
workout_19 = Workout.create(total_weight_lifted: 140, workout_type: "weight_lifting", calories_burned: 2000, duration_of_workout_minutes: 120)
workout_20 = Workout.create(total_weight_lifted: 145, workout_type: "mixed", calories_burned: 2500, duration_of_workout_minutes: 110)
workout_21 = Workout.create(total_weight_lifted: 290, workout_type: "weight_lifting", calories_burned: 1500, duration_of_workout_minutes: 80)
workout_22 = Workout.create(total_weight_lifted: 50, workout_type: "cardio", calories_burned: 500, duration_of_workout_minutes: 100)
workout_23 = Workout.create(total_weight_lifted: 50, workout_type: "cardio", calories_burned: 600, duration_of_workout_minutes: 120)
workout_24 = Workout.create(total_weight_lifted: 60, workout_type: "mixed", calories_burned: 1800, duration_of_workout_minutes: 80)
workout_25 = Workout.create(total_weight_lifted: 300, workout_type: "weight_lifting", calories_burned: 1200, duration_of_workout_minutes: 120)
workout_26 = Workout.create(total_weight_lifted: 70, workout_type: "cardio", calories_burned: 1000, duration_of_workout_minutes: 90)
workout_27 = Workout.create(total_weight_lifted: 70, workout_type: "weight_lifting", calories_burned: 1200, duration_of_workout_minutes: 70)
workout_28 = Workout.create(total_weight_lifted: 90, workout_type: "cardio", calories_burned: 1300, duration_of_workout_minutes: 80)
workout_29 = Workout.create(total_weight_lifted: 50, workout_type: "weight_lifting", calories_burned: 2200, duration_of_workout_minutes: 100)
workout_30 = Workout.create(total_weight_lifted: 130, workout_type: "weight_lifting", calories_burned: 300, duration_of_workout_minutes: 100)



jack.workouts << workout_1 
jack.workouts << workout_2
jack.workouts << workout_3
jack.workouts << workout_4
ally.workouts << workout_5
emily.workouts << workout_6 
emily.workouts << workout_7
john.workouts << workout_8 
john.workouts << workout_9 
john.workouts << workout_10 
sally.workouts << workout_11 
sally.workouts << workout_12 
aaron.workouts << workout_13 
aaron.workouts << workout_14 
aaron.workouts << workout_15
aaron.workouts << workout_16 
aaron.workouts << workout_17
nick.workouts << workout_18
nick.workouts << workout_19 
nick.workouts << workout_20
nick.workouts << workout_21
kun.workouts << workout_22 
kun.workouts << workout_23
kun.workouts << workout_24 
jack.workouts << workout_25
tobi.workouts << workout_26
tobi.workouts << workout_27
tobi.workouts << workout_28
aaron.workouts << workout_29
ally.workouts << workout_30


gym_1.workouts << workout_1
gym_1.workouts << workout_2
gym_1.workouts << workout_3
gym_1.workouts << workout_4
gym_1.workouts << workout_5
gym_1.workouts << workout_6
gym_1.workouts << workout_7
gym_1.workouts << workout_8
gym_1.workouts << workout_9
gym_2.workouts << workout_10
gym_2.workouts << workout_11
gym_2.workouts << workout_12
gym_2.workouts << workout_13
gym_2.workouts << workout_14
gym_2.workouts << workout_15
gym_2.workouts << workout_16
gym_2.workouts << workout_17
gym_2.workouts << workout_18
gym_3.workouts << workout_19
gym_3.workouts << workout_20 
gym_3.workouts << workout_21
gym_3.workouts << workout_22
gym_3.workouts << workout_23
gym_3.workouts << workout_24
gym_4.workouts << workout_25
gym_4.workouts << workout_26
gym_4.workouts << workout_27
gym_4.workouts << workout_28
gym_4.workouts << workout_29
gym_4.workouts << workout_30


david.workouts << workout_1
jess.workouts << workout_2
david.workouts << workout_3
anna.workouts << workout_4
anna.workouts << workout_5
ryan.workouts << workout_6
ryan.workouts << workout_7
jess.workouts << workout_8
david.workouts << workout_9
david.workouts << workout_10
ryan.workouts << workout_11
anna.workouts << workout_12
david.workouts << workout_13
david.workouts << workout_14
ryan.workouts << workout_15
anna.workouts << workout_16
jess.workouts << workout_17
david.workouts << workout_18
anna.workouts << workout_19
jess.workouts << workout_20
anna.workouts << workout_21
anna.workouts << workout_22
anna.workouts << workout_23
anna.workouts << workout_24
jess.workouts << workout_25
ryan.workouts << workout_26
ryan.workouts << workout_27
david.workouts << workout_28
david.workouts << workout_29
jess.workouts << workout_30




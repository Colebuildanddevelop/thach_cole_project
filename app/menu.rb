class Menu
  attr_accessor :user
  @@prompt = TTY::Prompt.new
  @@session = true
  
  def initialize(user)
    @user = user
  end 

  def display_response(resp)
    print_title
    puts "\n"
    resp.each { |r| 
      puts r.to_s.colorize(:green).bold.underline
    }
    puts "\n"
    where_to = @@prompt.select("Where to next?", ["Main menu!", "That is all the help I need!"])
    @@session = false if where_to == "That is all the help I need!"
  end 
    
  def user_menu
    while @@session do 
      print_title
      puts "Welcome to your own personal workout portal #{@user.name}!".colorize(:blue).bold
      option = @@prompt.select("How can we help you today?", %w(
        i_want_to_record_a_workout
        show_me_all_my_previous_workouts!
        what_diet_plan_should_I_be_on?
        what_gyms_are_available?
        which_gym_has_served_the_most_clients?
        which_gym_has_served_the_least_clients?
        what_trainers_are_available?
        what_is_my_total_weight_lifted?
        what_trainer_burned_the_most_calories?
        what_trainer_has_the_most_experience_lifting_weights?
        end_session
      ))
      case option 
      when "i_want_to_record_a_workout"  
        create_workout
        display_response(["Congratulations on completing your workout!"])
      when "show_me_all_my_previous_workouts!"
        display_response(@user.workouts)
        
      when "what_diet_plan_should_I_be_on?"
        display_response([@user.diet_plan_suggestion])
      when "what_is_my_total_weight_lifted?"
        display_response(["You have lifted a total of #{@user.total_weight_for_all_workouts} pounds for all recorded workouts!"])
      when "what_gyms_are_available?"
        display_response(Gym.all.map{ |gym| "#{gym.name}" })
      when "which_gym_has_served_the_most_clients?"
        display_response(["According to our calculations #{Gym.most_user.name} is the gym with the most customers at #{Gym.most_user.workouts.length} customers"])
      when "which_gym_has_served_the_least_clients?"
        display_response(["According to our calculations #{Gym.least_user.name} is the gym with the least customers at #{Gym.least_user.workouts.length} customers"])
      when "what_trainers_are_available?"
        display_response(Trainer.all.map { |t| "#{t.name}" })
      when "what_trainer_burned_the_most_calories?"
        t = Trainer.most_calories_burned
        display_response(["#{t.name} who burned #{t.total_calories_burned} calories"])
      when "what_trainer_has_the_most_experience_lifting_weights?"
        t = Trainer.most_experience_with_lifting
        display_response(["#{t.name} who has delivered #{t.num_workouts_with_weight_lifting} weight lifting sessions"])
      when "end_session"
        p "ending session"
        @@session = false
      end
    end 
  end

  def create_workout
    print_title
    trainer_name = @@prompt.select("Who did you train with?", Trainer.all.map { |trainer| trainer.name })
    trainer = Trainer.all.find { |t| t.name == trainer_name}
    gym_name = @@prompt.select("What gym did you train at?", Gym.all.map { |gym| gym.name })
    gym = Gym.all.find { |gym| gym.name == gym_name }
    p "How much weight did you lift?"
    total_weight_lifted = @@prompt.slider("Weight lifted", max: 1000, step:50, default: 100)
    workout_type = @@prompt.select("What type of workout did you do?", ["weight_lifting", "cardio", "mixed"])
    p "How many calories did you burn?"
    calories = @@prompt.slider("Calories", max: 1800, step:50, default: 900)
    p "How long was your workout? (minutes)"
    duration = @@prompt.slider("Length of workout", max: 240, step:5, default: 30)
    workout = Workout.create(
      total_weight_lifted: total_weight_lifted,
      workout_type: workout_type,
      calories_burned: calories,
      duration_of_workout_minutes: duration
    )
    @user.workouts << workout
    trainer.workouts << workout
    gym.workouts << workout
    workout
  end 
   
end 

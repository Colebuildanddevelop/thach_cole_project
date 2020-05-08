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
        what_trainer_is_the_best_suited?
        my_settings
        end_session
      ))
      case option 
      when "i_want_to_record_a_workout"  
        create_workout
        display_response(["Congratulations on completing your workout!"])
      when "show_me_all_my_previous_workouts!"
        if @user.workouts.empty?
          display_response(["You have not done any workout session."])
        else
        resp = @user.workouts.map {|w| "You trained at #{w.gym.name}, with #{w.trainer.name} as your trainer. You lifted #{w.total_weight_lifted} lbs, and burned #{w.calories_burned} within #{w.duration_of_workout_minutes} mins"}
        display_response(resp)
        end 
      when "what_diet_plan_should_I_be_on?"
        display_response([@user.diet_plan_suggestion])
      when "what_is_my_total_weight_lifted?"
        display_response(["You have lifted a total of #{@user.total_weight_for_all_workouts} pounds for all recorded workouts!"])
      when "what_gyms_are_available?"
        display_response(Gym.all.map{ |gym| "#{gym.name}" })
      when "which_gym_has_served_the_most_clients?"
        display_response(["According to our calculations #{Gym.most_user.name} is the gym with the most customers at #{Gym.most_user.workouts.length} customers."])
      when "which_gym_has_served_the_least_clients?"
        display_response(["According to our calculations #{Gym.least_user.name} is the gym with the least customers at #{Gym.least_user.workouts.length} customers."])
      when "what_trainers_are_available?"
        display_response(Trainer.all.map { |t| "#{t.name}" })
      when "what_trainer_burned_the_most_calories?"
        t = Trainer.most_calories_burned
        display_response(["#{t.name} who burned #{t.total_calories_burned} calories"])
      when "what_trainer_has_the_most_experience_lifting_weights?"
        t = Trainer.most_experience_with_lifting
        display_response(["#{t.name} who has delivered #{t.num_workouts_with_weight_lifting} weight lifting sessions."])
      when "what_trainer_is_the_best_suited?"
        display_response(["Given your desire of a #{user.desired_workout} workout, you should be trained by any of the following:", user.trainer_suggestion].flatten)
      when "my_settings"
        user_settings
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

  def user_settings
    print_title 
    trainer_name = @@prompt.select("Chose a setting to update", %w(
      change_my_username
      change_my_password
      change_my_name 
      change_my_age
      change_my_desired_workout
      delete_my_account
      go_back!
    ))    
    case trainer_name
    when "change_my_username"
      new_username = @@prompt.ask("Please type in your new username.")
      while User.find_by(username: new_username)
        puts "This username is already taken, please choose another"
        new_username = @@prompt.ask("Type in your new username")
      end  
      @user.username = new_username
      @user.save
      display_response(["You changed your username to #{new_username}!"])
    when "change_my_password"
      new_password = @@prompt.mask("Please type in your new password.")
      confirm_password = @@prompt.mask("Please confirm your new password.")
      while (new_password != confirm_password) do
        p "oops the passwords you entered did not match"
        new_password = @@prompt.mask("Please type in your new password.")
        confirm_password = @@prompt.mask("Please confirm your new password.")
      end 
      user.password = new_password
      user.save
      display_response(["You changed your password!"])
    when "change_my_name"
      new_name = @@prompt.ask("Please type in your new name.")
      user.name = new_name
      user.save
      display_response(["You changed your name to #{new_name}"])
    when "change_my_age"
      new_age = @@prompt.ask("Please enter your age here.")
      user.age = new_age
      user.save
      display_response(["You changed your age to #{new_age}"])
    when "change_desired_workout"
      new_desired_workout = @@prompt.select("Please chose a desired workout", %w(intense low_intensity mild))
      user.desired_workout = new_desired_workout
      user.save
      display_response(["You changed your desired workout to #{desired_workout}"])
    when "delete_my_account"
      password = @@prompt.mask("Please enter your password")
      if password == user.password
        delete_your_account = @@prompt.yes?("Are you sure you want to delete your account?")
        if delete_your_account
          user.destroy
          p "You have destroyed your account, hope you come back!"
          @@session = false
        else
          display_response(["We are glad you didn't leave us!"])
        end 
      end 
    when "go_back!"
      user_menu
    end 
  end 
end 

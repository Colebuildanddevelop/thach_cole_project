class Menu
  @@prompt = TTY::Prompt.new
  @@session = true

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
    
  def user_menu(user)
    while @@session do 
      print_title
      puts "Welcome to your own personal workout portal #{user.name}!".colorize(:blue).bold
      option = @@prompt.select("How can we help you today?", %w(
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
      when "what_is_my_total_weight_lifted?"
        display_response(["You have lifted a total of #{user.total_weight_for_all_workouts} pounds for all recorded workouts!"])
      when "what_gyms_are_available?"
        display_response(Gym.all.map{ |gym| "#{gym.name}" })
      when "which_gym_has_served_the_most_clients?"
        p Gym.most_user
        display_response(["According to our calculations #{Gym.most_user.name} is the gym with"])
      when "which_gym_has_served_the_least_clients?"
        p Gym.least_user
      when "what_trainers_are_available?"
        p Trainer.all.map { |t| t.name }
      when "what_trainer_burned_the_most_calories?"
        t = Trainer.most_calories_burned
        p "#{t.name} who burned #{t.total_calories_burned} calories"
      when "what_trainer_has_the_most_experience_lifting_weights?"
        t = Trainer.most_experience_with_lifting
        p "#{t.name} who has delivered #{t.num_workouts_with_weight_lifting} weight lifting sessions"
      when "end_session"
        p "ending session"
        @@session = false
      end
    end 
  end
end 

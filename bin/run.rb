# TODO
# create a cool hero title
# color code responses
# create a answer, and go back option
# integrate more functions




require 'pry'
require_relative '../config/environment'
$prompt = TTY::Prompt.new

def login
  #take username and password
  username = $prompt.ask("Please enter your username.")
  password = $prompt.mask("Please enter your password.")
  while !User.find_by(username: username, password: password)
    puts "oops either the username you entered was not found or the password was incorrect"
    username = $prompt.ask("Please enter your username.")
    password = $prompt.mask("Please enter your password.")
  end
  User.find_by(username: username, password: password)
end

def create_account
  # ask user for username make sure it username doesn't exist
  username = $prompt.ask("Please create a username.")
  while User.find_by(username: username)
    puts "this username is already taken, please choose another"
    username = $prompt.ask("Please create a username.")
  end  
  password = $prompt.mask("Please create a password.")
  name = $prompt.ask("What is your name?")
  gender = $prompt.ask("What is your gender?")
  age = $prompt.ask("What is your age?")
  desired_workout = $prompt.select("What is your desired style of workout?", %w(high_intensity low_intensity mild_intensity))
  
  user = User.create(
    username: username,
    password: password,
    name: name,
    gender: gender,
    age: age,
    desired_workout: desired_workout
  )  
end

def user_menu(user)
  session = true
  puts `clear`
  p "Welcome to your own personal workout portal #{user.name}!"
  while session do 
    option = $prompt.select("How can we help you today?", %w(
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
      puts `clear`
      p user.total_weight_for_all_workouts
    when "what_gyms_are_available?"
      p Gym.all.map { |g| g.name }
    when "which_gym_has_served_the_most_clients?"
      p Gym.most_user
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
      session = false
    end
  end 
end

def main 
  user = nil 
  p "Hello and welcome to the workout app"
  option = $prompt.select("Please login or create an account", %w(login create_account))
  if option == "create_account"
    user = create_account
  else 
    user = login
  end 
  user_menu(user)
end 

main


binding.pry 
0

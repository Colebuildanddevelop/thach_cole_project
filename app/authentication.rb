
class Authentication 
  @@prompt = TTY::Prompt.new
  def login
    #take username and password
    username = @@prompt.ask("Please enter your username.")
    password = @@prompt.mask("Please enter your password.")
    while !User.find_by(username: username, password: password)
      puts "oops either the username you entered was not found or the password was incorrect"
      username = @@prompt.ask("Please enter your username.")
      password = @@prompt.mask("Please enter your password.")
    end
    User.find_by(username: username, password: password)
  end

  def create_account
    # ask user for username make sure it username doesn't exist
    username = @@prompt.ask("Please create a username.")
    while User.find_by(username: username)
      puts "this username is already taken, please choose another"
      username = @@prompt.ask("Please create a username.")
    end  
    password = @@prompt.mask("Please create a password.")
    name = @@prompt.ask("What is your name?")
    gender = @@prompt.ask("What is your gender?")
    age = @@prompt.ask("What is your age?")
    desired_workout = @@prompt.select("What is your desired style of workout?", %w(high_intensity low_intensity mild_intensity))
    
    user = User.create(
      username: username,
      password: password,
      name: name,
      gender: gender,
      age: age,
      desired_workout: desired_workout
    )  
  end
end 

class Authentication 
  @@prompt = TTY::Prompt.new
  def login
    #take username and password
    username = @@prompt.ask("Please enter your username.")
    password = @@prompt.mask("Please enter your password.")
    while !User.find_by(username: username, password: password)
      puts "oops either the username you entered was not found or the password was incorrect"
      option = @@prompt.select("Do you want to try again", ["Go back", "Try again"])
      if option == "Go back"
       return nil
      end 
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
    confirm_password = @@prompt.mask("please re-enter your password")
    while (password != confirm_password) do
      p "oops the passwords you entered did not match"
      password = @@prompt.mask("please create a password")
      confirm_password = @@prompt.mask("please confirm your password")
    end 
    name = @@prompt.ask("What is your name?")
    age = @@prompt.ask("What is your age?")
    desired_workout = @@prompt.select("What is your desired style of workout?", %w(intense low_intensity mild))
    
    user = User.create(
      username: username,
      password: password,
      name: name,
      age: age,
      desired_workout: desired_workout
    )  
  end
end 
require_relative '../config/environment'
$prompt = TTY::Prompt.new

def main 
  auth = Authentication.new
  menu = nil
  print_title 
  option = $prompt.select("Please login or create an account", %w(login create_account))
  if option == "create_account"
    menu = Menu.new(auth.create_account)
  else 
    user = auth.login
    if user == nil 
      main
    end   
    menu = Menu.new(user)
  end 
  menu.user_menu
  puts "Good bye! Thank you for using our services!"
end 

main


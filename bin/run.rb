# TODO
# create a cool hero title x
# color code responses 
# create a answer, and go back option 
# integrate more functions

require 'pry'
require_relative '../config/environment'
$prompt = TTY::Prompt.new

def main 
  user = nil 
  auth = Authentication.new
  menu = Menu.new
  print_title 
  option = $prompt.select("Please login or create an account", %w(login create_account))
  if option == "create_account"
    user = auth.create_account
  else 
    user = auth.login
  end 
  menu.user_menu(user)
  puts "Good bye! Thank you for using our services!"
end 

main

binding.pry 
0

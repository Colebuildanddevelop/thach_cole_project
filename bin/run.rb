# TODO
# create a cool hero title x
# color code responses 
# create a answer, and go back option 
# integrate more functions

require 'pry'
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
    menu = Menu.new(auth.login)
  end 
  menu.user_menu
  puts "Good bye! Thank you for using our services!"
end 

main

binding.pry 
0

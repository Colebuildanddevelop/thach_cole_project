ENV["PLAYLISTER_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  u_1 = User.first   
  g_1 = Gym.first
  g_2 = Gym.find_by(name: '24 Hour Fitness')
  t_1 = Trainer.first
  w_1 = Workout.first
  binding.pry
end
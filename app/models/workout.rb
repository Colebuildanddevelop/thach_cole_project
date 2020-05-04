class Workout < ActiveRecord::Base
belongs_to :users
belongs_to :gyms 
belongs_to :trainers
end 
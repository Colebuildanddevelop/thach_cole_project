class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.integer :age 
      t.string :desired_workout
      
     
    end 
  end
end

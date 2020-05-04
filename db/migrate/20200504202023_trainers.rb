class Trainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :name 
      t.string :specialty
      t.string :temperament
      t.integer :cost_per_hour
    end 
  end
end

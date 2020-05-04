class Test < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.integer :num
    end 
  end
end

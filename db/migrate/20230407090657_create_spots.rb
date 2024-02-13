class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
     t.text :body
     t.integer :overall
     t.integer :level
     t.integer :q
     t.integer :w
     t.integer :e 
     t.integer :r 
     t.integer :t
     t.integer :y
     t.integer :u 
     t.integer :i
     t.integer :o
     t.integer :p
     t.integer :a 
     t.integer :s 
     t.integer :d 
     t.integer :f 
     t.integer :g 
     t.integer :h
     t.integer :j 

     t.timestamps
    end
   end
  end 


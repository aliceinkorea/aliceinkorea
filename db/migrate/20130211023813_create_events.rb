class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :title, null: false
      t.string :genre, null: false
      
      t.string :venue, null: false
      t.string :city, null: false
      
      t.date :start_date, null: false
      t.date :end_date
      
      
      t.string :age_group, null: false
      t.integer :run_time
      t.text :description, null: false
      
      t.string :image, null: false
      
      t.boolean :is_open, null: false, default: false
      
      t.timestamps
      
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :title, null: false
      t.string :genre, null: false
      
      t.string :venue
      t.string :city
      
      t.date :start_date
      t.date :end_date
      
      
      t.string :age_group
      t.integer :run_time
      t.text :description
      
      t.string :image, null: false
      
      t.string :status, null: false, default: Event::STATUS[0]
      
      t.timestamps
      
    end
  end
end

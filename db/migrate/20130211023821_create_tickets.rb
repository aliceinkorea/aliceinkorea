class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|

      t.string :title, null: false
      
      t.references :event, null: false
      
    end
  end
end

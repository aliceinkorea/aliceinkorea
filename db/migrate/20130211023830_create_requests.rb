class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|

      t.string :first_name, null: false
      t.string :last_name, null: false
      
      t.string :email, null: false
      
      t.integer :num_tickets, null: false
      t.text :message
      
      t.string :status, default: Request::STATUS[0]
      t.references :event, null: false
      t.timestamps
      
    end
  end
end

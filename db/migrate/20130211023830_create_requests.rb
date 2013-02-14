class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|

      t.string :first_name, null: false
      t.string :last_name, null: false
      
      t.string :email, null: false
      t.string :phone
      
      t.integer :count, null: false
      t.text :message
      
      t.references :event, null: false
      t.timestamps
      
    end
  end
end

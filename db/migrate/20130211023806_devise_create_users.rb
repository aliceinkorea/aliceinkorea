class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
    
      t.string :email,              null: false
      t.string :encrypted_password, null: false

      t.integer :admin, default: false
      
      t.timestamps
    end

  end
end

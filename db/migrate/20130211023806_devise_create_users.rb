class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
    
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.integer :admin
      
      t.timestamps
    end

  end
end

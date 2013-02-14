class User < ActiveRecord::Base
  
  devise :database_authenticatable, :validatable, :rememberable
          # :token_authenticatable, :confirmable,
          # :lockable, :timeoutable and :omniauthable

  attr_accessible :email, :password, :password_confirmation
   
end

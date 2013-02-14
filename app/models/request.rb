class Request < ActiveRecord::Base

  belongs_to :event
  
  attr_accessible :first_name, :last_name, :email, :phone, :count, :message
  
  def full_name
    first_name + ", " + last_name
  end
  
end

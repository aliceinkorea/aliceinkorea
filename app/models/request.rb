class Request < ActiveRecord::Base

  belongs_to :event
  
  attr_accessible :first_name, :last_name, :email, :num_tickets, :message
  
  STATUS = ['Not Processed', 
            'In Process', 
            'Closed']
            
  validates_inclusion_of :status, in: STATUS,
                         message: "Invalid status"
  
  def full_name
    first_name + ", " + last_name
  end
  
end

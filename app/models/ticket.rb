class Ticket < ActiveRecord::Base

  belongs_to :event
  
  attr_accessible :title, :datetime
end

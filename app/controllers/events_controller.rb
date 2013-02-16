class EventsController < ApplicationController
 
  def index
    @events = Event.where('status = ? ', 'Active')
  end
  
end

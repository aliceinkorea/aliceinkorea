class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate_admin
    unless current_user && current_user.admin?
      redirect_to root_url
    end
  end
  
  def verify_open_status
    return unless load_event
    
    if @event.is_open?
      redirect_to root_url
    end
    
  end
  
  def load_event
    @event = nil
    
    if params.has_key?(:id)
      @event = Event.find_by_id(params[:id])
    end
    
    if @event.blank?
      redirect_to root_url
      return false
    end
    
    return true
  end
  
end

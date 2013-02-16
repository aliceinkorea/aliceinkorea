class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    admin_url
  end

  def authenticate_admin
    unless current_user && current_user.admin?
      redirect_to root_url
    end
  end
  
  def verify_event_not_active
    return unless load_event
    if @event.is_active?
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
  
  def load_request
    @request = nil
    if params.has_key?(:id)
      @request = Request.find_by_id(params[:id])
    end
    if @request.blank?
      redirect_to root_url
      return false
    end
    return true
  end
  
end

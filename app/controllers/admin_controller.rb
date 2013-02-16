class AdminController < ApplicationController

  layout 'admin'
  
  before_filter :authenticate_admin
  before_filter :verify_event_not_active, only: [:preview_event]
  before_filter :load_event, only: [:change_event_status]
  before_filter :load_request, only: [:change_request_status]
  
  def index
    @events = Event.where('status = ?', 'Not Active')
    @requests = Request.where('status = ?', 'Not Processed')
  end
  
  def events
    @events = Event.all
  end
  
  def new_event
    @event = Event.new
  end
  
  def create_event
    @event = Event.new(params[:event])
    if @event.save
      redirect_to admin_preview_event_url(@event)
    else
      render 'new_event'
    end
  end
  
  def event_image_cache
    headers['Cache-Control'] = 'public; max-age=600' # cache image for 10 minutes
    send_file "#{Rails.root}/tmp/uploads/#{params['cache_id']}/#{params['filename']}", :disposition => 'inline', :type => "image/png"
  end
  
  def preview_event
  end
  
  def change_event_status
    @status = 'Not Active'
    if params[:status] == '1'
      @status = 'Active'
    elsif params[:status] == '2'
      @status = 'Closed'
    end
    @event.status = @status 
    @event.save!
    redirect_to admin_events_url
  end
  
  def requests
    @requests = Request.all
  end
  
  def change_request_status
    @status = 'Not Processed'
    if params[:status] == '1'
      @status = 'In Process' 
    elsif params[:status] == '2'
      @status = 'Closed' 
    end
    @request.status = @status 
    @request.save!
    redirect_to admin_requests_url
  end

end

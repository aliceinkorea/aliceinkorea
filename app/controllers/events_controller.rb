class EventsController < ApplicationController

  before_filter :authenticate_admin, except: [:index]
  before_filter :verify_open_status, only: [:preview, :open]
  
  def index
    @events = Event.where('is_open = ? ', true)
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    
    if @event.save
      redirect_to admin_preview_event_url(@event)
    else
      render 'new'
    end
  end
  
  def preview
  end
  
  def open
    @event.is_open = true
    @event.save!
    respond_to do |format|
      format.js { render 'layouts/redirect' }
    end
  end
  
  def image_cache
    headers['Cache-Control'] = 'public; max-age=600' # cache image for 10 minutes
    send_file "#{Rails.root}/tmp/uploads/#{params['cache_id']}/#{params['filename']}", :disposition => 'inline', :type => "image/png"
  end
  
end

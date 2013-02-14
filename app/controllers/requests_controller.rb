class RequestsController < ApplicationController
  
  before_filter :load_event, only: [:get_form]
  
  def get_form
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @request = Request.new(params[:request])
    @event_id = params[:event_id]
    @request.event_id = @event_id
    @request.save!
    
    if @request.errors.blank?
      RequestMailer.confirm_request(@request).deliver
    end
    
    respond_to do |format|
      format.js
    end
  end
  
end

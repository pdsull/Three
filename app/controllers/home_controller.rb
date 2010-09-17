class HomeController < ApplicationController
  
  layout 'nifty'
  
  def index
    
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    render :index
  end
  
  
end

class HomeController < ApplicationController
  
  layout 'nifty'
  before_filter :require_user
  
  def index
    
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    render :index
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  
end

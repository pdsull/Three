class HomeController < ApplicationController
  
  layout 'profi'
  before_filter :require_user
  
  def index
    @events = current_user.family.events
    @event = Event.new
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

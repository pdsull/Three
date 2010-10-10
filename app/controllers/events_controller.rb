class EventsController < ApplicationController
  
  layout 'profi'
  before_filter :require_user
  
  # GET /events
  # GET /events.xml
  def index
    @events = current_user.family.events
    @event = Event.new
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @edit_event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    @event.set_time
    @event.className = current_user.class_name
    
    @entry = Entry.new
    @entry.description = @event.title
    @entry.user_id = current_user.id
    @entry.family_id = current_user.family.id
    @entry.save

    respond_to do |format|
      if @event.save
        format.html { redirect_to(events_path, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      @event.set_time
      @event.save
      flash[:notice] = "Event Successfully Updated"
      redirect_to events_path
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_events
    @events = current_user.family.events.find(:all, :conditions => ["starttime >= '#{Time.zone.at(params['start'].to_i).to_s(:db)}' and starttime <= '#{Time.zone.at(params['end'].to_i).to_s(:db)}'"] )
    
    events = [] 
    @events.each do |event|
      events << {:id => event.id, :title => event.title, :start => "#{event.starttime.iso8601}", :end => "#{event.endtime.iso8601}", :allDay => event.all_day, :className => event.className}
    end
    render :text => events.to_json
  end
  
  def move
    @event = Event.find_by_id params[:id]
    if @event
      @event.starttime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.starttime))
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.all_day = params[:all_day]
      @event.save
    end
    render :update do |page|
      page<<"$('#calendar').fullCalendar('refetchEvents')"
    end
  end
  
  def resize
    @event = Event.find_by_id params[:id]
    if @event
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.save
    end    
  end
  
  
end

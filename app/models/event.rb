class Event < ActiveRecord::Base
  attr_accessor :event_date, :start_time, :end_time
  
  def set_time
    self.starttime = Time.parse(self.event_date + " " + self.start_time)
    self.endtime = Time.parse(self.event_date + " " + self.end_time)
  end
end

class Event < ActiveRecord::Base
  attr_accessor :event_date, :start_time, :end_time
  has_and_belongs_to_many :members
  
  def set_time
    self.starttime = Time.parse(self.event_date + " " + self.start_time)
    self.endtime = Time.parse(self.event_date + " " + self.end_time)
  end
end

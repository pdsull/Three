class Entry < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :description
end

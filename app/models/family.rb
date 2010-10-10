class Family < ActiveRecord::Base
  
  has_many :users
  has_many :events
  has_many :members
  has_many :entries
  
end

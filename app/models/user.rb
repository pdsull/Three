class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :time_zone
  
  acts_as_authentic
  
  belongs_to :family
end

class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :time_zone
  attr_accessor :second_user_name, :second_user_email
  
  acts_as_authentic do |u|
    u.login_field = :email
  end
  
  belongs_to :family
end

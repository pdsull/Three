class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :time_zone
      t.string :persistence_token
      t.datetime :last_login_at
      t.integer :family_id
      
      t.timestamps
    end
    
    add_index :users, ["username"], :name => "index_users_on_username", :unique => true
    add_index :users, ["email"], :name => "index_users_on_email", :unique => true
    add_index :users, ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
    
  end
  
  def self.down
    drop_table :users
  end
end

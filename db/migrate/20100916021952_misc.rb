class Misc < ActiveRecord::Migration
  def self.up
    add_column :users, :class_name, :string
    add_column :users, :perishable_token, :string
    add_column :events, :user_id, :integer
    add_column :events, :family_id, :integer
    add_column :events, :class_name, :string
    remove_column :events, :url
  end

  def self.down
    remove_column :users, :class_name
    remove_column :users, :perishable_token
    remove_column :events, :user_id
    remove_column :events, :family_id
    remove_column :events, :class_name
    add_column :events, :url, :string
  end
end

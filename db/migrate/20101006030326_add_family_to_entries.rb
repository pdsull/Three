class AddFamilyToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :family_id, :integer
  end

  def self.down
    remove_column :entries, :family_id
  end
end

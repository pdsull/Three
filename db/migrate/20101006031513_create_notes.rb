class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.integer :user_id
      t.integer :family_id
      t.integer :entry_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end

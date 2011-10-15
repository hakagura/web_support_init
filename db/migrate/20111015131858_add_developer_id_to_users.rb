class AddDeveloperIdToUsers < ActiveRecord::Migration
  def self.up
  	add_column :tickets, :developer_id, :integer
  end

  def self.down
  	remove_column :tickets, :developer_id
  end
end

class AddTicketIdToComments < ActiveRecord::Migration
  def self.up
  	add_column :comments, :ticket_id, :integer
  end

  def self.down
	remove_column :comments, :ticket_id
  end
end

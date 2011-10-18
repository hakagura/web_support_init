class AddTicketIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :ticket_id, :integer
  end

  def self.down
    remove_column :users, :ticket_id
  end
end

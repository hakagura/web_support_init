class AddTimeToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :time, :datetime
  end

  def self.down
    remove_column :tickets, :time
  end
end

class AddTimeToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :time, :string
  end

  def self.down
    remove_column :tickets, :time
  end
end

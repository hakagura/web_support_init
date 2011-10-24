class RemoveDocFromTickets < ActiveRecord::Migration
  def self.up
  	remove_column :tickets, :doc
  end

  def self.down
  	add_column :tickets, :doc, :string
  end
end

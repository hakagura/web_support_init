class AddDocToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :doc, :string
  end

  def self.down
    remove_column :tickets, :doc
  end
end

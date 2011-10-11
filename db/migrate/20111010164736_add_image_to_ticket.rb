class AddImageToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :image, :string
  end

  def self.down
    remove_column :tickets, :image
  end
end

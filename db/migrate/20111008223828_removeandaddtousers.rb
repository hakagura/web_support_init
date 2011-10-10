class Removeandaddtousers < ActiveRecord::Migration
  def self.up
  	remove_column :tickets, :assigned
  	add_column :tickets, :user_id, :integer
  end

  def self.down
  end
end

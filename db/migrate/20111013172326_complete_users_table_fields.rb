class CompleteUsersTableFields < ActiveRecord::Migration
  def self.up
  	add_column :users, :name, :string
  	add_column :users, :phone, :string
  	add_column :users, :mobile, :string
  	add_column :users, :status, :boolean
  end

  def self.down
  	remove_column :users, :name, :string
  	remove_column :users, :phone, :string
  	remove_column :users, :mobile, :string
  	remove_column :users, :status, :boolean  	
  end
end

class AddRoleToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :role, :string

    # Create a default user
    User.create!(:email => 'admin@leilaodeseminovos.com.br', :password => '20leilao11', :password_confirmation => '20leilao11', :role => 'admin')

  end

  def self.down
  	remove_column :users, :role
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
if User.count == 0
  puts "Creating admin user"
  User.create([{:role=>'admin'},{:email=>'leilao@leilao.com.br'},{:password => 'leilao123456'}])
  User.create([{:role=>'user'},{:email=>'junior@leilao.com.br'},{:password => 'leilao'}])
end


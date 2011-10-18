# encoding: utf-8
puts "Admin"
User.create!(:name => "Administrador", :role=>"admin",:email=>"admin@leilaodeseminovos.com.br",:password=>"leilao123456")
puts "Admin"
User.create!(:name => "Elias", :role=>"admin",:email=>"eliaswebdev@gmail.com",:password=>"586467")
puts "Admin"
User.create!(:name => "Rogerio", :role=>"admin",:email=>"argerim@gmail.com",:password=>"rogerio")
puts "User"
User.create!(:name => "Junior", :role=>"user",:email=>"junior@leilaodeseminovos.com.br",:password=>"leilao123456")
puts "User"
User.create!(:name => "Hakagura", :role=>"user",:email=>"hakagura@leilaodeseminovos.com.br",:password=>"leilao123456")

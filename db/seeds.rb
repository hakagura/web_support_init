# encoding: utf-8
puts "Admin"
User.create!(:role=>"admin",:email=>"admin@leilaodeseminovos.com.br",:password=>"leilao123456")
puts "Admin"
User.create!(:role=>"admin",:email=>"eliaswebdev@gmail.com",:password=>"586467")
puts "Admin"
User.create!(:role=>"admin",:email=>"argerim@gmail.com",:password=>"rogerio")
puts "User"
User.create!(:role=>"user",:email=>"junior@leilaodeseminovos.com.br",:password=>"leilao123456")
puts "User"
User.create!(:role=>"user",:email=>"hakagura@leilaodeseminovos.com.br",:password=>"leilao123456")

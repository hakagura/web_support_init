puts "Admin"
User.create!(:role=>"admin",:email=>"admin@leilao.com.br",:password=>"leilao123456")
puts "User"
User.create!(:role=>"user",:email=>"junior@leilao.com.br",:password=>"leilao123456")
puts "User"
User.create!(:role=>"user",:email=>"hakagura@leilao.com.br",:password=>"leilao123456")

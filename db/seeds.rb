puts "Admin"
User.create!(:name=>"esmerino",:role=>"admin",:email=>"admin@leilao.com.br",:password=>"leilao123456")
puts "User"
User.create!(:name=>"junior",:role=>"user",:email=>"junior@leilao.com.br",:password=>"leilao123456")
puts "User"
User.create!(:name=>"ana",:role=>"user",:email=>"hakagura@leilao.com.br",:password=>"leilao123456")

# encoding: utf-8
puts "Admin"
User.create!(:name => "Administrador", :role=>"admin",:email=>"administrador@administrador.com.br",:password=>"123456")
